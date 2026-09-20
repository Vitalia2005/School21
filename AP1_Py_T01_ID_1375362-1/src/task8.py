import sys

def solve():
    input_data = sys.stdin.read().split()
    if not input_data:
        return
    n = int(input_data[0])
    numbers = set()
    for i in range(1, n + 1):
        if i < len(input_data):
            numbers.add(int(input_data[i]))
    print(len(numbers))

solve()