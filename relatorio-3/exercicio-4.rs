fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    let peso1 = 2.0;
    let peso2 = 3.0;
    let peso3 = 5.0;

    let media = (nota1 * peso1 + nota2 * peso2 + nota3 * peso3) / (peso1 + peso2 + peso3);
    media
}

fn main() {
    let nota1 = 7.5;
    let nota2 = 8.0;
    let nota3 = 9.2;

    let media = calcular_media(nota1, nota2, nota3);
    println!("A média é: {}", media);

    if media >= 7.0 {
        println!("Aprovado");
    } else {
        println!("Reprovado");
    }
}