---
title: "Ανάλυση (Α' Δέσμη) -- Κ. Γκατζούλης, Μ. Καραμαύρος"
subtitle: "Ανεπίσημες λύσεις επιλεγμένων ασκήσεων"
author: "Λεόντιος Μαυροπαλιάς"
date: "26/04/2026"
---


::: { .problem title="(σ.162/20)" }
Θεωρούμε τις ακολουθίες $(\alpha_\nu)$, $(\beta_\nu)$, $(\gamma_\nu)$ για τις οποίες υποθέτουμε ότι

i) $\alpha_\nu > 0, \quad \beta_\nu > 0, \quad \gamma_\nu > 0, \quad \nu \in \mathbb{N}^*$
ii) $3\alpha_{\nu+1} \leq \beta_\nu + \gamma_\nu, \quad 3\beta_{\nu+1} \leq \alpha_\nu + \gamma_\nu, \quad 3\gamma_{\nu+1} \leq \alpha_\nu + \beta_\nu, \quad  \nu \in \mathbb{N}^*$

Να αποδείξετε ότι $\lim \alpha_\nu = \lim \beta_\nu = \lim \gamma_\nu = 0$. 
:::

::: { .solution }
Με πρόσθεση κατά μέλη:

\begin{gather*}
3(\alpha_{\nu+1} + \beta_{\nu+1} + \gamma_{\nu+1}) < 2(\alpha_\nu + \beta_\nu + \gamma_\nu) \Rightarrow \\
\frac{\alpha_{\nu+1} + \beta_{\nu+1} + \gamma_{\nu+1}}{\alpha_\nu + \beta_\nu + \gamma_\nu} < \frac23
\end{gather*}
Από το κριτήριο του πηλίκου (σ. 137) για $\lambda = \frac23 \in (0,1)$ παίρνουμε ότι 

$$\lim (\alpha_\nu + \beta_\nu + \gamma_\nu) = 0 \tag{1}$$

Τώρα για το $(\alpha_\nu)$:

\begin{gather*}
\alpha_{\nu+1} \leq \beta_\nu + \gamma_\nu < \alpha_\nu + \beta_\nu + \gamma_\nu \Rightarrow \\
\left| \alpha_{\nu+1}  \right| < \frac{\alpha_\nu + \beta_\nu + \gamma_\nu }{3} \Rightarrow \\
-\frac{\alpha_\nu + \beta_\nu + \gamma_\nu }{3} < \left| \alpha_{\nu+1}  \right| < \frac{\alpha_\nu + \beta_\nu + \gamma_\nu }{3} 
\end{gather*}

Από το κριτήριο παρεμβολής και λόγω της (1) παίρνουμε $\lim \alpha_{\nu+1} = 0 \Rightarrow  \lim \alpha_{\nu} = 0$
:::


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


::: { .problem title="(σ.162/27)" }
Αν οι ακολουθίες $(\alpha_\nu)$, $(\beta_\nu)$ έχουν όριο το 0 και όρους θετικοούς να αποδείξετε ότι οι
ακολουθίες

i) $(\gamma_\nu)$ με $\gamma_\nu = \frac{\alpha_\nu^2 - 3\beta_\nu^2}{\alpha_\nu + \nu^2}$
ii) $(\delta_\nu)$ με $\delta_\nu = \frac{\alpha_\nu^3 - \nu\beta_\nu^2}{\lambda^\nu\alpha_\nu^3 + \nu^2 \beta_\nu}$

έχουν όριο το 0.
:::

::: { .solution }

i) \begin{gather*}
\gamma_\nu = \frac{\alpha_\nu^2 - 3\beta_\nu^2}{\alpha_\nu + \nu^2} \leq \frac{\alpha_\nu^2 - 3\beta_\nu^2}{\nu^2} = \frac{\alpha_\nu^2}{\nu^2} - \frac{3\beta_\nu^2}{\nu^2} \Rightarrow \\
-\left|\frac{\alpha_\nu^2}{\nu^2} - \frac{3\beta_\nu^2}{\nu^2}\right| \leq \gamma_\nu \leq \left|\frac{\alpha_\nu^2}{\nu^2} - \frac{3\beta_\nu^2}{\nu^2}\right| \tag{1}
\end{gather*}

Αφού $\lim \alpha \rightarrow 0,\; \alpha_\nu > 0$, $\exists  \kappa > 0, \nu_0 \in \mathbb{N}^*: \; \alpha_\nu < \kappa \; \forall \nu > \nu_0$. Ομοίως $\exists \lambda > 0: \; \beta_\nu < \lambda \; \forall \nu > \nu_0$.

Αρκεί να δείξουμε ότι

$$
\lim \left( \frac{\alpha_\nu^2}{\nu^2} - \frac{3\beta_\nu^2}{\nu^2} \right) = 0 \tag{2}
$$

Θέλουμε να υπάρχει $\nu_1 \in \mathbb{N}^*$ έτσι ώστε

$$
\nu > \nu_1 \Rightarrow \left|\gamma_\nu\right| < \epsilon
$$

Αλλά 

$$
\left|\gamma_\nu \right| \leq \frac{\kappa^2 + 3\lambda^2}{\nu^2}
$$

Μπορούμε να σφίξουμε την ανισότητα $\left|\gamma_\nu\right| < \epsilon$ και να
ζητήσουμε $\frac{\kappa^2 + 3\lambda^2}{\nu^2} < \epsilon$.

\begin{gather*}
\frac{\kappa^2 + 3\lambda^2}{\nu^2} < \epsilon \Leftarrow \\
\nu > \sqrt{\frac{\kappa^2 + 3\lambda^2}{\epsilon}}
\end{gather*}

Άρα $\forall \nu \in \mathbb{N}^*:\; \nu > \sqrt{\frac{\kappa^2 + 3\lambda^2}{\epsilon}} \Rightarrow \gamma_\nu < \frac{\kappa^2 + 3\lambda^2}{\nu^2} < \epsilon$ 
και σύμφωνα με τον ορισμό του ορίου η (2) αποδείχθηκε. Λόγω της (2), από τη (1)
και με το κριτήριο παρεμβολής έπεται $\lim \gamma_\nu = 0$.

ii)
:::
