#include <iostream>
#include <string>

using namespace std;

class Pessoa {
protected:
    string nome;

public:
    Pessoa(string nome) {
        this->nome = nome;
    }

    virtual void apresentar() {
        cout << "Olá, meu nome é " << nome << " e eu sou uma pessoa." << endl;
    }
    
    virtual ~Pessoa() {}
};

class Professor : public Pessoa {
private:
    string disciplina;

public:
    Professor(string nome, string disciplina) : Pessoa(nome) {
        this->disciplina = disciplina;
    }

    void apresentar() override {
        cout << "Olá, meu nome é " << nome << " e eu sou um professor de " << disciplina << "." << endl;
    }
};

class Aluno : public Pessoa {
private:
    string curso;

public:
    Aluno(string nome, string curso) : Pessoa(nome) {
        this->curso = curso;
    }

    void apresentar() override {
        cout << "Olá, meu nome é " << nome << " e eu sou um aluno de " << curso << "." << endl;
    }
};

int main() {
    Pessoa* ptrPessoa1 = new Professor("Dr. Carvalho", "Cálculo");
    Pessoa* ptrPessoa2 = new Aluno("Ana", "Engenharia de Software");

    cout << "--- Demonstração de Polimorfismo ---" << endl;
    
    ptrPessoa1->apresentar();
    ptrPessoa2->apresentar();

    delete ptrPessoa1;
    delete ptrPessoa2;

    return 0;
}