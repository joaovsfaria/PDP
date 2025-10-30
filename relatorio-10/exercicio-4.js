class Hunter {
  #nome;
  #idade;
  #localizacao;

  constructor(nome, local, idade) {
    this.#nome = nome;
    this.#localizacao = local;
    this.#idade = idade;
  }

  getNome() {
    return this.#nome;
  }

  getLocalizacao() {
    return this.#localizacao;
  }

  getIdade() {
    return this.#idade;
  }
}

class Especialista extends Hunter {
  #habilidadeNen;

  constructor(nome, habilidade) {
    super(nome, "Desconhecido", 0);
    this.#habilidadeNen = habilidade;
  }

  rastrearLocal(lat, long) {
    return `${this.getNome()} (Especialista) rastreando em ${lat}, ${long}. Habilidade Nen: ${this.#habilidadeNen}`;
  }
}

class Manipulador extends Hunter {
  #alvoAtual;

  constructor(nome) {
    super(nome, "Desconhecido", 0);
    this.#alvoAtual = null;
  }

  definirAlvo(alvo) {
    this.#alvoAtual = alvo;
  }

  rastrearLocal(lat, long) {
    let statusAlvo = this.#alvoAtual 
      ? `Rastreando alvo: ${this.#alvoAtual.getNome()}` 
      : "Sem alvo definido";
    return `${this.getNome()} (Manipulador) em ${lat}, ${long}. ${statusAlvo}`;
  }
}

class Batalhao {
  #hunters;

  constructor() {
    this.#hunters = new Set();
  }

  adicionarHunter(hunter) {
    const tamanhoAntes = this.#hunters.size;
    this.#hunters.add(hunter);
    if (this.#hunters.size > tamanhoAntes) {
      console.log(`${hunter.getNome()} adicionado ao batalhão.`);
    } else {
      console.log(`${hunter.getNome()} já está no batalhão (duplicata ignorada).`);
    }
  }

  getNumHunters() {
    return this.#hunters.size;
  }

  iniciarRastreamento(lat, long) {
    console.log(`\n--- Iniciando Rastreamento em ${lat}, ${long} ---`);
    const resultados = [];
    this.#hunters.forEach(hunter => {
      if (typeof hunter.rastrearLocal === 'function') {
        const resultado = hunter.rastrearLocal(lat, long);
        console.log(resultado);
        resultados.push(resultado);
      }
    });
    return resultados;
  }
}

console.log("=== Sistema da Associação Hunter ===\n");

const kurapika = new Especialista("Kurapika", "Correntes");
const shalnark = new Manipulador("Shalnark");
const illumi = new Manipulador("Illumi");

illumi.definirAlvo(kurapika);

const batalhao = new Batalhao();

console.log("--- Adicionando Hunters ao Batalhão ---");
batalhao.adicionarHunter(kurapika);
batalhao.adicionarHunter(shalnark);
batalhao.adicionarHunter(illumi);
batalhao.adicionarHunter(kurapika);

console.log(`\nTotal de Hunters no batalhão: ${batalhao.getNumHunters()}`);

// Iniciando rastreamento
const relatorio = batalhao.iniciarRastreamento("22.1°N", "44.5°W");

console.log("\n--- Relatório Completo ---");
console.log(`Hunters rastreados: ${relatorio.length}`);