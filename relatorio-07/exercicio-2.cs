using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Nome { get; protected set; }

    public Pokemon(string nome)
    {
        this.Nome = nome;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"{this.Nome} usa um ataque genérico.");
    }
}

public class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine($"{this.Nome} lança uma bola de fogo!");
    }
}

public class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine($"{this.Nome} lança um jato de água!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        List<Pokemon> meusPokemons = new List<Pokemon>();

        meusPokemons.Add(new PokemonDeFogo("Charizard"));
        meusPokemons.Add(new PokemonDeAgua("Blastoise"));

        foreach (Pokemon pokemon in meusPokemons)
        {
            pokemon.Atacar();
        }
    }
}