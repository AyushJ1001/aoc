# https://adventofcode.com/2024/day/1
from collections import Counter


PART = 2

if PART == 1:
    with open("input/day1", "r") as f:
        left_list: list[int] = []
        right_list: list[int] = []
        for line in f:
            left, right = line.split()
            left_list.append(int(left))
            right_list.append(int(right))
        print(sum([abs(a - b) for a, b in zip(sorted(left_list), sorted(right_list))]))

if PART == 2:
    with open("input/day1", "r") as f:
        left_list: list[int] = []
        right_list: list[int] = []
        for line in f:
            left, right = line.split()
            left_list.append(int(left))
            right_list.append(int(right))

        right_counter = Counter(right_list)
        print(right_counter)

        print(sum([i * right_counter[i] for i in left_list]))
