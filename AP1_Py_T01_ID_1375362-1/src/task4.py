try:
    line = input().strip()
    n = int(line)
    if n <= 0 or '.' in line or ',' in line:
        print("Natural number was expected")
    else:
        row = [1]
        for i in range(n):
            print(*(row))
            row = [1] + [row[j] + row[j + 1] for j in range(len(row) - 1)] + [1]
except ValueError:
    print("Natural number was expected")