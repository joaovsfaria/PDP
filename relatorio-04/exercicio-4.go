package main

import ("fmt")

func verificarLogin(usuario, senha string) bool {
	if usuario == "senha" && senha == "admin" {
		return true
	}
	return false
}

func main() {

	var usuario, senha string

	for {

		fmt.Println("Digite o usuario e senha")
		fmt.Scan(&usuario, &senha)
		
		if verificarLogin(usuario, senha) {
			fmt.Println("Login bem-sucedido!")
			break
		} else {
			fmt.Println("Usuário ou senha incorretos. Tente novamente.")
		}
}
}