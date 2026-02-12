# CLASS FLD S8 Scan (w₀–wₐ)

This module provides a **numerical exploration** of how the large-scale
structure clustering parameter **S₈** responds to standard
w₀–wₐ dark-energy deformations, computed using the
**CLASS Boltzmann solver** with its **fluid dark energy (FLD)** module.

---

## Scope and Status

- **Numerical / phenomenological only**
- **Not** part of any derivation, proof, or structural argument
- Intended for **context, sensitivity checks, and illustration**
- Results should not be interpreted as predictions of any model

This code is included to document how conventional
dark-energy parameterizations affect S₈ within linear perturbation theory.

---

## Definition

We use the standard definition:
\[
S_8 = \sigma_8 \left(\frac{\Omega_m}{0.3}\right)^{1/2},
\]
where:
- \(\sigma_8\) is the RMS matter fluctuation on 8 h⁻¹ Mpc scales
- \(\Omega_m\) is the present-day matter density fraction

---

## Methodology

- Background and perturbations are computed using **CLASS**
- Dark energy is modeled using **fluid dark energy (FLD)**
- The expansion history is closed internally by CLASS (no explicit
  \(\Omega_\Lambda\) or \(\Omega_\mathrm{fld}\) is specified)

### Baseline
- ΛCDM baseline is implemented via FLD with:
  - \(w_0 = -1\)
  - \(w_a = 0\)

### Deformations
We introduce a one-parameter deformation:
\[
\begin{aligned}
w_0 &= -1 + 0.6\,\alpha, \\
w_a &= -1.2\,\alpha,
\end{aligned}
\]
with several representative values of \(\alpha\).

This parameterization is chosen purely for illustration and has
no model-independent significance.

---

## Directory Structure


