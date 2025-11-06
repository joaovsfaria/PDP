import java.util.HashMap;

interface IRastreavel {
    String obterCoordenadas();
}

class Poder {
    private String nome;

    public Poder(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }
}

class Youkai implements IRastreavel {
    public String nome;
    private String localizacao;
    private Poder poder;

    public Youkai(String nome, String local, Poder poder) {
        this.nome = nome;
        this.localizacao = local;
        this.poder = poder;
    }

    @Override
    public String obterCoordenadas() {
        return this.localizacao;
    }
}

class Alien implements IRastreavel {
    public String nome;
    private String localizacao;
    private String planetaOrigem;
    private String Ovni;
    private Poder poder;

    public Alien(String nome, String planeta, String Ovni, Poder poder) {
        this.nome = nome;
        this.planetaOrigem = planeta;
        this.Ovni = Ovni;
        this.poder = poder;
    }

    @Override
    public String obterCoordenadas() {
        return this.localizacao;
    }
}

class RegistoOculto {
    public String nomeEquipe;
    private HashMap<String, IRastreavel> avistamentos;

    public RegistoOculto(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this.avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(IRastreavel entidade, String nome) {
        if (!avistamentos.containsKey(nome)) {
            avistamentos.put(nome, entidade);
            return true;
        }
        return false;
    }
}