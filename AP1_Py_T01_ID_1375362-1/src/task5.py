import sys


def parse_float(s):
    s = s.strip()
    if not s:
        raise ValueError("Invalid input")

    sign = 1
    start = 0
    if s[0] == '-':
        sign = -1
        start = 1
    elif s[0] == '+':
        start = 1

    if start >= len(s):
        raise ValueError("Invalid input")

    dot_count = 0
    int_part = 0
    frac_part = 0
    frac_div = 1
    has_digits = False

    has_dot = False
    for i in range(start, len(s)):
        char = s[i]
        if char == '.':
            if has_dot:
                raise ValueError("Invalid input")
            has_dot = True
        elif '0' <= char <= '9':
            has_digits = True
            digit = ord(char) - ord('0')
            if not has_dot:
                int_part = int_part * 10 + digit
            else:
                frac_part = frac_part * 10 + digit
                frac_div *= 10
        else:
            raise ValueError("Invalid input")

    if not has_digits:
        raise ValueError("Invalid input")

    val = int_part + (frac_part / frac_div if frac_div > 1 else 0)
    return sign * val


try:
    line = sys.stdin.read().strip()
    if not line:
        print("error")
    else:
        val = parse_float(line)
        res = val * 2
        print(f"{res:.3f}")
except Exception:
    print("error")