n = int(input())
if n < 0:
    print(False)
else:
    orig = n
    rev = 0
    while orig > 0:
        rev = rev * 10 + orig % 10
        orig //= 10
    print(n == rev)