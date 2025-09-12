package main

import (
	"fmt"
)

func main() {
	var input int
	fmt.Print("Digite um número: ")
	_, err := fmt.Scan(&input)
	if err != nil {
		fmt.Println("Entrada inválida!")
		return
	}

	switch {
	case input%2 == 0:
		fmt.Println("O número é par")
	default:
		fmt.Println("O número é ímpar")
	}
}
