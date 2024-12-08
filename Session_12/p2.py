import numpy as np
import matplotlib.pyplot as plt

# Given:
pi = np.pi
x = np.linspace(0, pi, 200)
f = np.sin(x)

# Best least-squares approximation coefficients (approx values found above)
a0, a1, a2 = -0.05145, 1.311, -0.4177
p2 = a0 + a1*x + a2*x**2

# Lagrange interpolant
q2 = -4.0/(pi**2) * x*(x - pi)

# Plot
plt.figure(figsize=(8,6))
plt.plot(x, f, label='f(x)=sin(x)', linewidth=2)
plt.plot(x, p2, label='p2(x) best LS approx', linestyle='--', linewidth=2)
plt.plot(x, q2, label='q2(x) Lagrange interpolant', linestyle=':', linewidth=2)
plt.title('Comparison of f, p2, and q2 on [0, π]')
plt.xlabel('x')
plt.ylabel('y')
plt.legend()
plt.grid(True)
plt.show()
