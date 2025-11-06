import java.util.ArrayList;

class Cafe {
    private String nome;
    private double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    public String getNome() {
        return nome;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    public double calcularPrecoFinal() {
        return this.precoBase;
    }
}

class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonus) {
        super(nome, precoBase);
        this.bonusAroma = bonus;
    }

    @Override
    public double calcularPrecoFinal() {
        return super.getPrecoBase() + this.bonusAroma;
    }
}

class Menu {
    private ArrayList<Cafe> itens;

    public Menu(ArrayList<Cafe> itens) {
        this.itens = itens;
    }

    public void adicionarItem(Cafe cafe) {
        this.itens.add(cafe);
    }
}

class CafeLeblanc {
    private Menu menu;

    public CafeLeblanc(Menu menu) {
        this.menu = menu;
    }

    public void receberPedido(Cafe cafe) {
        System.out.println("Pedido recebido: " + cafe.getNome());
    }
}