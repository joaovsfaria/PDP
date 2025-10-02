#include <iostream>
#include <string>
#include <vector>

using namespace std;

class SerVivo {
protected:
    string nome;

public:
    SerVivo(string nome) {
        this->nome = nome;
    }

    virtual void apresentar() {
        cout << "Um ser vivo genérico se apresenta." << endl;
    }

    virtual ~SerVivo() {}
};

class Humano : public SerVivo {
public:
    Humano(string nome) : SerVivo(nome) {}

    void apresentar() override {
        cout << "Eu sou " << nome << ", um Humano forte e determinado." << endl;
    }
};

class Elfo : public SerVivo {
public:
    Elfo(string nome) : SerVivo(nome) {}

    void apresentar() override {
        cout << "Saudações. Sou " << nome << ", um Elfo da floresta antiga." << endl;
    }
};

class Fada : public SerVivo {
public:
    Fada(string nome) : SerVivo(nome) {}

    void apresentar() override {
        cout << "Pirlimpimpim! Sou a fada " << nome << ", protetora da natureza!" << endl;
    }
};

int main() {
    vector<SerVivo*> listaDeSeres;

    listaDeSeres.push_back(new Humano("Aragorn"));
    listaDeSeres.push_back(new Elfo("Legolas"));
    listaDeSeres.push_back(new Fada("Sininho"));

    cout << "--- Apresentações no Mundo de Fantasia ---" << endl;
    for (SerVivo* ser : listaDeSeres) {
        ser->apresentar();
    }
    cout << "----------------------------------------" << endl;

    for (SerVivo* ser : listaDeSeres) {
        delete ser;
    }
    listaDeSeres.clear();

    return 0;
}