v1 = list(map(float, input().split()))
v2 = list(map(float, input().split()))
print(sum(a * b for a, b in zip(v1, v2)))