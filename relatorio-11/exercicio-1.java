class Divisao {
    private String nome;

    public Divisao(String nome) {
        this.nome = nome;
    }
    
    public String getNome() {
        return nome;
    }
}

class Personagem {
    private String nome;
    private int idade;

    public Personagem(String nome, int idade) {
        this.nome = nome;
        this.idade = idade;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }
    
    public void setIdade(int idade) {
        this.idade = idade;
    }
}

class Mago extends Personagem {
    private String magia;

    public Mago(String nome, int idade, String magia) {
        super(nome, idade);
        this.magia = magia;
    }
    
    public String getMagia() {
        return magia;
    }

    public String lancarFeitico() {
        return getNome() + " lança " + this.magia;
    }
}

class Castelo {
    private String nome; 
    private ArrayList<Divisao> divisoes;

    public Castelo(String nome, ArrayList<Divisao> divisoes) {
        this.nome = nome;
        this.divisoes = divisoes;
    }
    
    public String getNome() {
        return nome;
    }

    public void adicionarDivisao(Divisao divisao) {
        this.divisoes.add(divisao);
    }
}