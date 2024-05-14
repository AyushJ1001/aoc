package day2

import (
	"fmt"
	"os"
	"strconv"
	"strings"
)

type set struct {
	red   int
	green int
	blue  int
}

type game struct {
	sets []set
	id   int
}

func getGame(line string) (*game, error) {
	temp := strings.Split(line, ":")
	id, err := strconv.Atoi(temp[0][5:])
	if err != nil {
		return nil, fmt.Errorf("invalid id")
	}
	secondPart := temp[1]
	fmt.Printf("Second Part: %s\n", secondPart)
	rounds := strings.Split(secondPart, ";")
	var sets []set

	for _, round := range rounds {
		turns := strings.Split(round, ", ")
		red := 0
		green := 0
		blue := 0
		for _, turn := range turns {
			fmt.Printf("Turn: %s\n", turn)
			tokens := strings.Split(turn, " ")
			count, _ := strconv.Atoi(tokens[0])
			color := tokens[1]
			fmt.Printf("Color: %s\n", color)

			switch color {
			case "red":
				red = count
			case "green":
				green = count
			case "blue":
				blue = count
			default:
				return nil, fmt.Errorf("invalid color")
			}
		}
		sets = append(sets, set{red, green, blue})
	}

	return &game{sets, id}, nil
}

func Run() {
	content, err := os.ReadFile("day2/test1")
	lines := strings.Split(string(content), "\n")

	var games []*game
	for i, line := range lines {
		game, err := getGame(line)
		if err != nil {
			fmt.Printf("Error in getting game %d!\n", i+1)
			fmt.Println(err)
			return
		}

		games = append(games, game)
	}

	if err != nil {
		fmt.Println("Error reading file!")
		return
	}
	fmt.Printf("%+v", games)
}
