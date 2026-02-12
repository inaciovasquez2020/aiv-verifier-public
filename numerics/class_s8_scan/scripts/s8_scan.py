from scripts.theory_class import compute_theory

def S8(sig8, Om):
    return sig8 * (Om/0.3)**0.5

lcdm = compute_theory(-1.0, 0.0)
s8_lcdm = S8(*lcdm)

print("ΛCDM S8 =", s8_lcdm)

for alpha in [0.05, 0.10, 0.15]:
    w0 = -1 + 0.6*alpha
    wa = -1.2*alpha
    sig8, Om = compute_theory(w0, wa)
    s8 = S8(sig8, Om)
    print(
        f"α={alpha:4.2f}  "
        f"w0={w0:6.3f}  wa={wa:6.3f}  "
        f"S8={s8:.4f}  ΔS8={s8-s8_lcdm:+.4f}"
    )
