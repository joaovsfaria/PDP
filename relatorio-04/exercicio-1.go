package main

import (
	"fmt"
)

func ClassificarNumero(num int) string {
	if num > 0 {
		return "Positivo"
	} else if num == 0 {
		return "Zero"
	}
	return "Negativo"
}

func main() {
	var input int
	fmt.Print("Digite um número: ")
	_, err := fmt.Scan(&input)
	if err != nil {
		fmt.Println("Entrada inválida!")
		return
	}
	fmt.Println(ClassificarNumero(input))
}
