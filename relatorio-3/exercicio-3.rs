use std::io;

fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    for i in limite_inferior..=limite_superior {
        let resultado = numero * i;
        println!("{} x {} = {}", numero, i, resultado);
    }
}

fn main() {
    println!("Digite o número da tabuada:");
    let mut input_numero = String::new();
    io::stdin().read_line(&mut input_numero).expect("Erro ao ler entrada");
    let numero: i32 = input_numero.trim().parse().expect("Número inválido");

    println!("Digite o limite inferior:");
    let mut input_inferior = String::new();
    io::stdin().read_line(&mut input_inferior).expect("Erro ao ler entrada");
    let limite_inferior: i32 = input_inferior.trim().parse().expect("Número inválido");

    println!("Digite o limite superior:");
    let mut input_superior = String::new();
    io::stdin().read_line(&mut input_superior).expect("Erro ao ler entrada");
    let limite_superior: i32 = input_superior.trim().parse().expect("Número inválido");

    imprimir_tabuada(numero, limite_inferior, limite_superior);
}