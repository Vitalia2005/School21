import sys


def solve():
    input_data = sys.stdin.read().split()
    if not input_data:
        return

    n = int(input_data[0])
    x = float(input_data[1])

    coeffs = []
    for i in range(2, n + 3):
        coeffs.append(float(input_data[i]))

    deriv_coeffs = []
    for i in range(len(coeffs) - 1):
        power = n - i
        deriv_coeffs.append(coeffs[i] * power)

    result = 0.0
    for i, coeff in enumerate(deriv_coeffs):
        power = n - 1 - i
        result += coeff * (x ** power)

    print(f"{result:.3f}")


solve()
