class Pokemon {
  #vida;
  nome;
  tipo;

  constructor(nome, tipo, vidaInicial) {
    this.nome = nome;
    this.tipo = tipo;
    this.#vida = vidaInicial;
  }

  getVida() {
    return this.#vida;
  }

  receberDano(dano) {
    this.#vida -= dano;
    if (this.#vida < 0) {
      this.#vida = 0;
    }
    console.log(`${this.nome} recebeu ${dano} de dano! Vida restante: ${this.#vida}`);
  }

  atacar(alvo) {
    console.log(`${this.nome} usa um ataque genérico...`);
    alvo.receberDano(5);
  }
}

class PokemonFogo extends Pokemon {
  bonusAtaque;

  constructor(nome, vidaInicial, bonus) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = bonus;
  }

  atacar(alvo) {
    console.log(`${this.nome} usa o Lança-Chamas!`);
    const danoTotal = 10 + this.bonusAtaque;
    alvo.receberDano(danoTotal);
  }
}

class PokemonAgua extends Pokemon {
  curaBase;

  constructor(nome, vidaInicial, curaBase) {
    super(nome, "Água", vidaInicial);
    this.curaBase = curaBase;
  }

  atacar(alvo) {
    console.log(`${this.nome} usa o Jato d'Água!`);
    alvo.receberDano(8);
  }
}

const charizard = new PokemonFogo("Charizard", 100, 5);
const blastoise = new PokemonAgua("Blastoise", 120, 10);

console.log("--- Início da Batalha ---");
console.log(`${charizard.nome} (${charizard.tipo}) - Vida: ${charizard.getVida()}`);
console.log(`${blastoise.nome} (${blastoise.tipo}) - Vida: ${blastoise.getVida()}`);
console.log("");

charizard.atacar(blastoise);
console.log(`${blastoise.nome} tem ${blastoise.getVida()} de vida.`);
console.log("");

blastoise.atacar(charizard);
console.log(`${charizard.nome} tem ${charizard.getVida()} de vida.`);
console.log("");

charizard.atacar(blastoise);
console.log(`${blastoise.nome} tem ${blastoise.getVida()} de vida.`);
console.log("");

console.log("--- Fim da Batalha ---");
console.log(`${charizard.nome} - Vida final: ${charizard.getVida()}`);
console.log(`${blastoise.nome} - Vida final: ${blastoise.getVida()}`);