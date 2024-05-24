with open("./inputs/day1/prod", "r") as f:
    lines = f.read().splitlines()
    part = 2

    if part == 1:
        print(len([i for i in range(len(lines)) if i > 0 and lines[i] > lines[i - 1]]))
    else:  # part 2
        print(
            len(
                [
                    i
                    for i in range(1, len(lines) - 2)
                    if int(lines[i + 2]) > int(lines[i - 1])
                ]
            )
        )

        # for i in range(1, len(lines) - 2):
        #     prev = int(lines[i-1])+int(lines[i])+int(lines[i+1])
        #     total = int(lines[i])+int(lines[i+1])+int(lines[i+2])

        #     print(f"Group {i}: {total} ({"increased" if total > prev else "no change" if total == prev else "decreased"})")
