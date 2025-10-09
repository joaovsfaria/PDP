using System;

public abstract class MonstroSombrio
{
    public string Nome { get; protected set; }

    public MonstroSombrio(string nome)
    {
        this.Nome = nome;
    }

    public abstract void Mover();
}

public class Zumbi : MonstroSombrio
{
    public Zumbi(string nome) : base(nome)
    {
    }

    public override void Mover()
    {
        Console.WriteLine($"{this.Nome} se arrasta lentamente...");
    }
}

public class Espectro : MonstroSombrio
{
    public Espectro(string nome) : base(nome)
    {
    }

    public override void Mover()
    {
        Console.WriteLine($"{this.Nome} flutua rapidamente pelas paredes!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        MonstroSombrio[] horda = {
            new Zumbi("Devorador de Cérebros"),
            new Espectro("Sombra Agonizante"),
            new Zumbi("Andarilho Pútrido")
        };

        Console.WriteLine("A horda sombria avança!");
        foreach (MonstroSombrio monstro in horda)
        {
            monstro.Mover();
        }
    }
}