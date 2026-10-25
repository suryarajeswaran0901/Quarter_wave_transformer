# Quarter-Wave Transformer Impedance Matching (Octave)

Simulation of a quarter-wave (λ/4) transformer that matches a 50 Ω transmission line to a mismatched load. Done as a mini project for **EC3551 – Transmission Lines and RF Systems** (Unit III).

## Theory
A λ/4 line section of impedance Z_T placed between the source line and the load gives

    Z_in = Z_T² / Z_L

Setting Z_in = Z₀ gives the design condition

    Z_T = √(Z₀ · Z_L)

so the reflection cancels at the design frequency f₀. The section length is l = λ/4 = c / (4f₀).

Other equations used:
- Reflection coefficient: Γ = (Z_L − Z₀) / (Z_L + Z₀)
- VSWR = (1 + |Γ|) / (1 − |Γ|)
- Return loss = −20 log₁₀ |Γ| (dB)

## Test cases

| Case | Z₀ | Z_L | f₀ | Z_T | λ/4 length | \|Γ|\ without | Bandwidth (\|Γ|\ < 0.1) |
|------|----|-----|----|-----|------------|-------------|-----------------------|
| 1 | 50 Ω | 300 Ω | 2.4 GHz | 122.5 Ω | 31.25 mm | 0.714 | 2.25–2.55 GHz (12.6 %) |
| 2 | 50 Ω | 100 Ω | 1.0 GHz | 70.7 Ω | 75 mm | 0.333 | 0.82–1.18 GHz (36.7 %) |

## Results
- |Γ| drops to 0 at the design frequency in both cases.
- The transformer is narrowband; a larger Z_L/Z₀ ratio gives a narrower bandwidth.



![Case 1](case1.png)




![Case 2](case2.png)



## How to run
1. Install [GNU Octave](https://octave.org/).
2. Open `qwt.m` and set `Z0`, `ZL`, `f0` on the first line.
3. Run the script. It prints the design values and plots |Γ| and return loss versus frequency.

## Author
Surya R – III Year ECE, University College of Engineering, Kanchipuram
