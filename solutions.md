---
title: "Ανάλυση (Α' Δέσμη) -- Κ. Γκατζούλης, Μ. Καραμαύρος"
subtitle: "Ανεπίσημες λύσεις"
author: "Λεόντιος Μαυροπαλιάς"
date: "26/04/2026"
---

::: { .problem title="(σ.162/22)" }
Αν η ακολουθία $\beta_\nu$ έχει όρους θετικούς να αποδείξετε ότι έχει
όριο το 0 η ακολουθία $\alpha_\nu$ με

$$
\alpha_{\nu} = \frac{(1+\sqrt1)(1+\sqrt2)\ldots (1+\sqrt{\nu})}{(1+\beta_1)(2+\beta_2)\ldots(\nu+\beta_\nu)}
$$
:::

::: { .solution }
\emph{Λύση.} Θα χρησιμοποιήσουμε το κριτήριο του πηλίκου για $\nu > \nu_0, \; \nu, \, \nu_0 \in \mathbb{N}^*$ (σ. 137): για να δείξουμε ότι $\lim \alpha_{\nu} = 0$, αρκεί να αποδείξουμε ότι $\exists \lambda \in (0,1):\; \frac{\alpha_{\nu+1}}{\alpha_\nu} < \lambda \; \forall \nu > \nu_0$, όπου $\lambda$, $\nu_0$ είναι συγκεκριμένοι. 

$$
\frac{\alpha_{\nu+1}}{\alpha_\nu} =
\frac{\frac{\cancel{(1+\sqrt1)}\cancel{(1+\sqrt2)}\ldots \cancel{(1+\sqrt{\nu})}(1+\sqrt{\nu+1})}{\cancel{(1+\beta_1)}\cancel{(2+\beta_2)}\ldots\cancel{(\nu+\beta_\nu)}(\nu+1+\beta_{\nu+1})}}
{\frac{\cancel{(1+\sqrt1)}\cancel{(1+\sqrt2)}\ldots \cancel{(1+\sqrt{\nu})}}{\cancel{(1+\beta_1)}\cancel{(2+\beta_2)}\ldots\cancel{(\nu+\beta_\nu)}}} =
\frac{1 + \sqrt{\nu + 1}}{\nu + 1 + \beta_\nu}
$$

Επειδή $\beta_{\nu}>0$, $\nu+1+\beta_\nu > \nu+1$. 

$$
\therefore \; \frac{\alpha_{\nu+1}}{\alpha_\nu} = \frac{1 + \sqrt{\nu + 1}}{\nu + 1 + \beta_\nu} < \frac{1 + \sqrt{\nu + 1}}{\nu + 1} = \frac{1}{\nu+1} + \frac{1}{\sqrt{\nu+1}}
$$

Η συνάρτηση $f(\nu) = \frac{1}{\nu+1} + \frac{1}{\sqrt{\nu+1}}$ είναι γν. φθίνουσα με 
$f(3) = \frac{1}{4} + \frac{1}{2} = \frac{3}{4}$. Έτσι το κριρήριο του πηλίκου πληρούται:

$$f(\nu) = \frac{1}{\nu+1} + \frac{1}{\sqrt{\nu+1}} < f(3) = \underbrace{\frac{3}{4}}_{\lambda} \quad \forall \nu > 3$$
:::