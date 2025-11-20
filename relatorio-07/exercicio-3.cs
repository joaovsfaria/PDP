using System;
using System.Collections.Generic;

public class Feitico
{
    public string Nome { get; set; }

    public Feitico(string nome)
    {
        this.Nome = nome;
    }
}

public class Ferramenta
{
    public string Nome { get; set; }

    public Ferramenta(string nome)
    {
        this.Nome = nome;
    }
}

public class Grimorio
{
    private List<Feitico> feiticos = new List<Feitico>();

    public void AdicionarFeitico(Feitico novoFeitico)
    {
        feiticos.Add(novoFeitico);
        Console.WriteLine($"Feitiço '{novoFeitico.Nome}' adicionado ao grimório.");
    }
}

public class Maga
{
    public string Nome { get; private set; }
    public Grimorio MeuGrimorio { get; private set; }
    private List<Ferramenta> ferramentas;

    public Maga(string nome, List<Ferramenta> ferramentasDeFora)
    {
        this.Nome = nome;
        this.MeuGrimorio = new Grimorio();
        this.ferramentas = ferramentasDeFora;
    }

    public void ListarFerramentas()
    {
        Console.WriteLine($"\n--- Ferramentas de {this.Nome} ---");
        foreach (var ferramenta in ferramentas)
        {
            Console.WriteLine($"- {ferramenta.Nome}");
        }
        Console.WriteLine("-----------------------------");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        List<Ferramenta> kitDeSobrevivencia = new List<Ferramenta>();
        kitDeSobrevivencia.Add(new Ferramenta("Corda"));
        kitDeSobrevivencia.Add(new Ferramenta("Lanterna"));
        kitDeSobrevivencia.Add(new Ferramenta("Faca"));

        Maga frieren = new Maga("Frieren", kitDeSobrevivencia);

        frieren.MeuGrimorio.AdicionarFeitico(new Feitico("Feitiço para Coletar Flores"));
        frieren.MeuGrimorio.AdicionarFeitico(new Feitico("Zoltraak"));

        frieren.ListarFerramentas();
    }
}