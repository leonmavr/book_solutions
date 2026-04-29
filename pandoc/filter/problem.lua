-- Lua filter: convert Divs with classes `problem` and `solution` into LaTeX environments
-- Usage: pandoc --lua-filter=pandoc/filter/problem.lua

local function has_class(el, name)
  if not el.classes then return false end
  for _, c in ipairs(el.classes) do
    if c == name then return true end
  end
  return false
end

-- parse page/ex numbers from a title string like "(σ.162/22)" -> 162, 22
local function parse_page_ex(title)
  if not title or title == '' then return nil end
  -- look for <digits> / <digits>
  local p, e = title:match("(%d+)%s*/%s*(%d+)")
  if p and e then
    return tonumber(p), tonumber(e)
  end
  return nil
end

-- check if a solution Div already begins with 'Λύση' or a raw \emph macro
local function solution_has_leading_lysis(sol_div)
  if not sol_div or not sol_div.content or #sol_div.content == 0 then return false end
  local first_block = sol_div.content[1]
  if not first_block then return false end
  local ok, text = pcall(pandoc.utils.stringify, first_block)
  if not ok or not text then return false end
  if string.match(text, '^%s*Λύση') then return true end
  if string.match(text, '^%s*\\emph') then return true end
  return false
end

function Pandoc(doc)
  local blocks = doc.blocks
  local problems = {}
  local to_remove = {}
  local first_problem_index = nil

  local i = 1
  while i <= #blocks do
    local b = blocks[i]
    if b.t == 'Div' and has_class(b, 'problem') then
      local prob = { original_index = i, problem_block = b, solution_block = nil }
      -- capture following solution if immediately present
      local nextb = blocks[i+1]
      if nextb and nextb.t == 'Div' and has_class(nextb, 'solution') then
        prob.solution_block = nextb
      end
      -- get raw title attribute
      local attr_title = ''
      if prob.problem_block.attributes and prob.problem_block.attributes.title then
        attr_title = prob.problem_block.attributes.title
      end
      prob.attr_title = attr_title
      -- parse page/ex numbers (for sorting)
      local p, e = parse_page_ex(attr_title)
      if p and e then
        prob.page = p
        prob.ex = e
      else
        prob.page = math.huge
        prob.ex = math.huge
      end
      table.insert(problems, prob)
      if not first_problem_index then first_problem_index = i end
      table.insert(to_remove, i)
      if prob.solution_block then
        table.insert(to_remove, i+1)
        i = i + 2
      else
        i = i + 1
      end
    else
      i = i + 1
    end
  end

  if #problems == 0 then return doc end

  -- sort by page, then exercise, then original index to keep stable order
  table.sort(problems, function(a,b)
    if a.page ~= b.page then return a.page < b.page end
    if a.ex ~= b.ex then return a.ex < b.ex end
    return a.original_index < b.original_index
  end)

  -- build skip set for removed indices
  local skip = {}
  for _, idx in ipairs(to_remove) do skip[idx] = true end

  local new_blocks = {}
  local inserted = false
  for idx = 1, #blocks do
    if skip[idx] then
      if not inserted and idx == first_problem_index then
        -- insert sorted problems here
        for k, prob in ipairs(problems) do
          -- compose auto-numbered title
          local composed_title = 'Άσκηση ' .. tostring(k)
          if prob.attr_title ~= nil and prob.attr_title ~= '' and not string.find(prob.attr_title, 'Άσκηση', 1, true) then
            composed_title = composed_title .. ' ' .. prob.attr_title
          end
          table.insert(new_blocks, pandoc.RawBlock('latex', '\\begin{problem}[' .. composed_title .. ']'))
          for _, inner in ipairs(prob.problem_block.content) do table.insert(new_blocks, inner) end
          table.insert(new_blocks, pandoc.RawBlock('latex', '\\end{problem}'))
          if prob.solution_block then
            local sol_title = ''
            if prob.solution_block.attributes and prob.solution_block.attributes.title then sol_title = prob.solution_block.attributes.title end
            table.insert(new_blocks, pandoc.RawBlock('latex', '\\begin{solution}[' .. sol_title .. ']'))
              if not solution_has_leading_lysis(prob.solution_block) then
                table.insert(new_blocks, pandoc.Para{pandoc.Emph{pandoc.Str('Λύση.')}})
              end
              for _, inner in ipairs(prob.solution_block.content) do table.insert(new_blocks, inner) end
            table.insert(new_blocks, pandoc.RawBlock('latex', '\\end{solution}'))
          end
        end
        inserted = true
      end
      -- skip original problem/solution blocks
    else
      table.insert(new_blocks, blocks[idx])
    end
  end

  return pandoc.Pandoc(new_blocks, doc.meta)
end
