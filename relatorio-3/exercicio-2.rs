use std::io;

fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    println!("Jogador 1, escolha 'par' ou 'ímpar':");
    let mut escolha = String::new();
    io::stdin()
        .read_line(&mut escolha)
        .expect("Erro ao ler entrada");
    let escolha = escolha.trim();

    println!("Jogador 1, digite um número:");
    let mut input1 = String::new();
    io::stdin()
        .read_line(&mut input1)
        .expect("Erro ao ler entrada");
    let numero1: i32 = input1.trim().parse().expect("Número inválido");

    println!("Jogador 2, digite um número:");
    let mut input2 = String::new();
    io::stdin()
        .read_line(&mut input2)
        .expect("Erro ao ler entrada");
    let numero2: i32 = input2.trim().parse().expect("Número inválido");

    let soma = numero1 + numero2;

    let soma_eh_par = eh_par(soma);

    if (escolha == "par" && soma_eh_par) || (escolha == "ímpar" && !soma_eh_par) {
        println!("A soma é {}. Jogador 1 venceu!", soma);
    } else {
        println!("A soma é {}. Jogador 2 venceu!", soma);
    }
}
