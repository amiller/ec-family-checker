# ec-family-checker

Checks a family of elliptic curves over Q(t) for Souk's Busy Forest sources: torsion group T and r independent sections. Each target has its own entry, `targets/Z<T>_rank<r>.sh`, run as `sh targets/Z2_rank8.sh submission.json`. Exit 0 passes.

A submission is JSON:

```json
{"a": ["a1(t)", "a2(t)", "a3(t)", "a4(t)", "a6(t)"], "sections": [["x1(t)", "y1(t)"], ...]}
```

Coefficients and coordinates are rational functions in `t` written with digits, `t`, `+ - * / ^` and brackets only; anything else is refused before gp runs. Exactly r sections.

What it checks, with the PARI/gp 2.17.4 binary in this repo (sha256 70ed8131…, the one the EC Rank checker pins):
1. every section lies on the curve over Q(t), exactly;
2. at three fibres t0 derived from the submission's SHA-256 (skipping singular ones), the torsion subgroup is exactly T and the specialised sections' height matrix is positive definite, so they are independent there.

Independence at a fibre shows the family's generic rank is at least r; torsion at three fibres is evidence, not proof, that T is the generic torsion. Examples: `examples/good.json` (torsion Z/2, rank 1) passes `Z2_rank1`; `examples/bad.json` (a point off the curve) fails.
