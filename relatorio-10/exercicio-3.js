class Criatura {
  nome;
  perigosa;

  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

class Diario {
  #autorSecreto;
  enigmas;
  criaturasAvistadas;

  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map();
    this.criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
    console.log(`Enigma ${num} adicionado ao diário.`);
  }

  decodificar(chave, num) {
    if (!this.enigmas.has(num)) {
      return "Enigma não encontrado!";
    }
    
    if (chave === this.#autorSecreto) {
      return this.enigmas.get(num);
    }
    
    return "Acesso negado! Chave incorreta.";
  }
}

class Personagem {
  nome;
  idade;

  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

class Protagonista extends Personagem {
  diario;

  constructor(nome, idade, diario) {
    super(nome, idade);
    this.diario = diario;
  }
}

class CabanaMisterio {
  visitantes;
  diario;

  constructor(diario) {
    this.visitantes = [];
    this.diario = diario;
  }

  listarFuncionarios() {
    return this.visitantes.filter(p => p instanceof Personagem);
  }
}

console.log("=== Gravity Falls - Sistema de Diário ===\n");

const diario3 = new Diario("Stanford Pines");

const dipper = new Protagonista("Dipper", 12, diario3);
const mabel = new Personagem("Mabel", 12);
const soos = new Personagem("Soos", 22);
const wendy = new Personagem("Wendy", 15);

const gnomo = new Criatura("Gnomo", false);
const billCipher = new Criatura("Bill Cipher", true);

diario3.criaturasAvistadas.push(gnomo, billCipher);

diario3.adicionarEnigma(1, "A verdade sobre Gravity Falls está enterrada nas profundezas...");
diario3.adicionarEnigma(2, "Bill Cipher não deve ser invocado sob nenhuma circunstância!");
diario3.adicionarEnigma(3, "O portal dimensional foi construído com propósitos científicos...");

console.log("\n--- Tentativa de Decodificação ---");
console.log("Dipper tenta decodificar enigma 1 com chave errada:");
console.log(dipper.diario.decodificar("Stanley Pines", 1));

console.log("\nDipper tenta decodificar enigma 2 com chave correta:");
console.log(dipper.diario.decodificar("Stanford Pines", 2));

console.log("\n--- Cabana do Mistério ---");
const cabana = new CabanaMisterio(diario3);
cabana.visitantes.push(mabel, soos, wendy);

console.log("Funcionários da Cabana:");
cabana.listarFuncionarios().forEach(f => {
  console.log(`- ${f.nome}, ${f.idade} anos`);
});

console.log("\n--- Criaturas Avistadas ---");
diario3.criaturasAvistadas.forEach(c => {
  console.log(`- ${c.nome} (Perigosa: ${c.perigosa ? 'Sim' : 'Não'})`);
});

console.log(`\n--- Autor Secreto do Diário ---`);
console.log(`O autor do diário 3 é: ${diario3.getAutor()}`);