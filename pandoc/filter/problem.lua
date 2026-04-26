-- Lua filter: convert Divs with classes `problem` and `solution` into LaTeX environments
-- Usage: pandoc --lua-filter=pandoc/filter/problem.lua

local function has_class(el, name)
  if not el.classes then return false end
  for _, c in ipairs(el.classes) do
    if c == name then return true end
  end
  return false
end

-- counter for automatic numbering of problems
local problem_counter = 0

function Div(el)
  if has_class(el, 'problem') then
    -- increment and compose title: prefix with 'Άσκηση N' unless user already included it
    problem_counter = problem_counter + 1
    local attr_title = ''
    if el.attributes and el.attributes.title then attr_title = el.attributes.title end
    local composed_title
    if attr_title ~= nil and attr_title ~= '' and string.find(attr_title, 'Άσκηση', 1, true) then
      composed_title = attr_title
    else
      composed_title = 'Άσκηση ' .. tostring(problem_counter)
      if attr_title ~= nil and attr_title ~= '' then composed_title = composed_title .. ' ' .. attr_title end
    end
    local begin_block = pandoc.RawBlock('latex', '\\begin{problem}[' .. composed_title .. ']')
    local end_block   = pandoc.RawBlock('latex', '\\end{problem}')
    local blocks = {begin_block}
    for i, b in ipairs(el.content) do table.insert(blocks, b) end
    table.insert(blocks, end_block)
    return blocks
  elseif has_class(el, 'solution') then
    local title = ''
    if el.attributes and el.attributes.title then title = el.attributes.title end
    local begin_block = pandoc.RawBlock('latex', '\\begin{solution}[' .. title .. ']')
    local end_block   = pandoc.RawBlock('latex', '\\end{solution}')
    local blocks = {begin_block}
    for i, b in ipairs(el.content) do table.insert(blocks, b) end
    table.insert(blocks, end_block)
    return blocks
  end
end
