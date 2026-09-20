with open('input.txt', 'r') as f:
    grid = [[int(x) for x in line.split()] for line in f if line.strip()]

n = len(grid)
m = len(grid[0]) if n > 0 else 0
visited = [[False] * m for _ in range(n)]

squares = 0
circles = 0

for r in range(n):
    for c in range(m):
        if grid[r][c] == 1 and not visited[r][c]:
            component = []
            stack = [(r, c)]
            visited[r][c] = True

            while stack:
                curr_r, curr_c = stack.pop()
                component.append((curr_r, curr_c))
                for dr, dc in [(-1, 0), (1, 0), (0, -1), (0, 1)]:
                    nr, nc = curr_r + dr, curr_c + dc
                    if 0 <= nr < n and 0 <= nc < m and grid[nr][nc] == 1 and not visited[nr][nc]:
                        visited[nr][nc] = True
                        stack.append((nr, nc))

            min_r = min(cell[0] for cell in component)
            max_r = max(cell[0] for cell in component)
            min_c = min(cell[1] for cell in component)
            max_c = max(cell[1] for cell in component)

            height = max_r - min_r + 1
            width = max_c - min_c + 1

            if height == width and len(component) == height * width:
                squares += 1
            else:
                circles += 1

print(f"{squares} {circles}")