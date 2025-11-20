#include <iostream>
#include <string>

using namespace std;

class Pessoa {
private:
    string nome;
    int idade;

public:
    Pessoa(string nome, int idade) {
        this->nome = nome;
        this->idade = idade;
    }

    string getNome() {
        return this->nome;
    }

    int getIdade() {
        return this->idade;
    }
};

class Protagonista : public Pessoa {
private:
    int nivel;

public:
    Protagonista(string nome, int idade, int nivel) : Pessoa(nome, idade) {
        this->nivel = nivel;
    }

    int getNivel() {
        return this->nivel;
    }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string nome, int idade, int rank) : Pessoa(nome, idade) {
        this->rank = rank;
    }

    int getRank() {
        return this->rank;
    }
};

int main() {
    Protagonista prota("Joker", 17, 99);
    Personagem aliado("Makoto Niijima", 18, 10);

    cout << "--- Acesso via Métodos ---" << endl;
    
    cout << "Nome do Protagonista: " << prota.getNome() << endl;
    cout << "Nível do Protagonista: " << prota.getNivel() << endl;
    
    cout << endl;

    cout << "Nome do Personagem: " << aliado.getNome() << endl;
    cout << "Rank do Personagem: " << aliado.getRank() << endl;
    
    // A linha abaixo causaria um erro de compilação,
    // demonstrando que o atributo 'nivel' é privado e não pode ser acessado diretamente.
    // cout << prota.nivel; 

    return 0;
}