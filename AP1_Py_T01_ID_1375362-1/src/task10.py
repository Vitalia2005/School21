import sys


def solve():
    try:
        input_data = sys.stdin.read().split()
        if not input_data:
            print("error")
            return

        if len(input_data) < 2:
            print("error")
            return

        n = int(input_data[0])
        target_time = int(input_data[1])

        if n <= 0 or target_time <= 0:
            print("error")
            return

        expected_len = 2 + n * 3
        if len(input_data) != expected_len:
            print("error")
            return

        idx = 2
        devices = []
        for _ in range(n):
            year = int(input_data[idx])
            cost = int(input_data[idx + 1])
            time = int(input_data[idx + 2])
            idx += 3

            if year <= 0 or cost <= 0 or time <= 0:
                print("error")
                return

            devices.append((year, cost, time))

        min_cost = None

        for i in range(n):
            for j in range(i + 1, n):
                d1 = devices[i]
                d2 = devices[j]

                if d1[0] == d2[0] and d1[2] + d2[2] == target_time:
                    total_cost = d1[1] + d2[1]
                    if min_cost is None or total_cost < min_cost:
                        min_cost = total_cost

        if min_cost is not None:
            print(min_cost)
        else:
            print("error")

    except Exception:
        print("error")


solve()