package main

import ("fmt")

func fibonacci(n int) {
	fbArr := make([]int, n) 
	for i := 0; i <n; i++ {
		if i == 0 {
			fbArr[i] = 0;
		} else if i == 1 {
			fbArr[i] = 1;
		} else {
			fbArr[i] = fbArr[i-1]+fbArr[i-2]
		}
	}
	fmt.Print("(")
	for i, v := range fbArr {
		if i > 0 {
			fmt.Print(", ")
		}
		fmt.Print(v)
	}
	fmt.Println(")")
}

func main() {
	input := 0
	fmt.Print("Digite um número: ")
	_, err := fmt.Scan(&input)
	if err != nil {
		fmt.Println("Entrada inválida")
		return
	}
	if input < 0 {
		fmt.Println("Número deve ser não-negativo")
		return
	}
	fibonacci(input)
}