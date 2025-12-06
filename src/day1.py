file = "inputs/day1.txt"
#
# part 1
with open(file, "r") as f:
    password = 0
    position = 50

    for line in f.readlines():
        op = line.strip()
        dir, dist = op[0], int(op[1:])

        if dir == "L":
            position = (position - dist) % 100
        else:
            position = (position + dist) % 100

        if position == 0:
            password += 1

    print(password)

# part 2
with open(file, "r") as f:
    password = 0
    position = 50

    for line in f.readlines():
        op = line.strip()
        dir, dist = op[0], int(op[1:])

        for _ in range(dist):
            if dir == "L":
                position = (position - 1) % 100
            else:
                position = (position + 1) % 100

            if position == 0:
                password += 1

    print(password)
