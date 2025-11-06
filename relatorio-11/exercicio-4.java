import java.util.LinkedHashSet;
import java.util.HashMap;

class PadraoAtaque {
    public String nome;
    public int dano;

    public PadraoAtaque(String nome, int dano) {
        this.nome = nome;
        this.dano = dano;
    }
}

class Boss {
    public String nome;
    private String idBoss;
    private String pontoFraco;
    private LinkedHashSet<PadraoAtaque> moveset;

    public Boss(String nome, String id, String fracoContra) {
        this.nome = nome;
        this.idBoss = id;
        this.pontoFraco = fracoContra;
        this.moveset = new LinkedHashSet<>();
    }

    public String getIdBoss() {
        return idBoss;
    }

    public void adicionarAtaque(PadraoAtaque ataque) {
        this.moveset.add(ataque);
    }

    public void iniciarFase() {
        System.out.println("Iniciando fase: " + this.nome);
    }
}

class BossMagico extends Boss {
    public BossMagico(String nome, String id, String fracoContra) {
        super(nome, id, fracoContra);
    }

    @Override
    public void iniciarFase() {
        System.out.println("O Boss Mágico " + this.nome + " inicia a fase!");
    }
}

class Batalha {
    private HashMap<String, Boss> arena;

    public Batalha() {
        this.arena = new HashMap<>();
    }

    public void adicionarBoss(Boss boss) {
        this.arena.put(boss.getIdBoss(), boss);
    }

    public void iniciarBatalha(String idBoss) {
        Boss boss = this.arena.get(idBoss);
        if (boss != null) {
            boss.iniciarFase();
        } else {
            System.out.println("Boss não encontrado na arena!");
        }
    }
}