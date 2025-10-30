class ODM_gear {
  modelo;
  #gasRestante;

  constructor(modelo) {
    this.modelo = modelo;
    this.#gasRestante = 100;
  }

  usarGas(quantidade) {
    if (this.#gasRestante >= quantidade) {
      this.#gasRestante -= quantidade;
      console.log(`*ziiip* Usou ${quantidade} de gás.`);
      return true;
    }
    console.log("Gás insuficiente!");
    return false;
  }

  getGas() {
    return this.#gasRestante;
  }
}

class Soldado {
  nome;
  #gear;

  constructor(nome, modeloGear) {
    this.nome = nome;
    this.#gear = new ODM_gear(modeloGear);
  }

  explorarTerritorio() {
    const conseguiu = this.#gear.usarGas(20);
    if (conseguiu) {
      return `${this.nome} está explorando o território...`;
    }
    return `${this.nome} não pode explorar, falta gás!`;
  }

  verificarEquipamento() {
    return `${this.nome} verifica seu gear (${this.#gear.modelo}): ${this.#gear.getGas()}% de gás restante.`;
  }
}

class Esquadrao {
  lider;
  membros;

  constructor(lider, membrosIniciais) {
    this.lider = lider;
    this.membros = membrosIniciais;
  }

  adicionarMembro(soldado) {
    this.membros.push(soldado);
    console.log(`${soldado.nome} foi adicionado ao esquadrão de ${this.lider.nome}.`);
  }

  explorarTerritorio() {
    let resultado = `Esquadrão de ${this.lider.nome} iniciando exploração!\n`;
    this.membros.forEach(s => {
      resultado += s.explorarTerritorio() + '\n';
    });
    return resultado;
  }

  relatarStatus() {
    return this.membros.map(s => s.verificarEquipamento());
  }
}

const levi = new Soldado("Levi", "Modelo Avançado");
const mikasa = new Soldado("Mikasa", "Modelo Padrão");
const armin = new Soldado("Armin", "Modelo Padrão");

const esquadraoLevi = new Esquadrao(levi, [mikasa]);
esquadraoLevi.adicionarMembro(armin);

console.log("--- Relatório de Status ---");
console.log(esquadraoLevi.relatarStatus());
console.log("\n--- Iniciando Missão ---");
console.log(esquadraoLevi.explorarTerritorio());
console.log("\n--- Explorando Novamente ---");
console.log(esquadraoLevi.explorarTerritorio());
console.log("\n--- Status Final ---");
console.log(esquadraoLevi.relatarStatus());