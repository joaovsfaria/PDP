#include <iostream>
#include <string>

using namespace std;

class Personagem {
public:
    string nome;
    int nivel;
    int dano;
    int vida;

    Personagem(string nome, int nivel, int dano, int vida) {
        this->nome = nome;
        this->nivel = nivel;
        this->dano = dano;
        this->vida = vida;
    }

    void atacar(Personagem &alvo) {
        cout << "⚔️  " << this->nome << " ataca " << alvo.nome << "!" << endl;
        alvo.vida -= this->dano;
        cout << "💥  " << alvo.nome << " perdeu " << this->dano << " pontos de vida." << endl;
    }

    void mostrarInfo() {
        cout << "--- Status ---" << endl;
        cout << "Nome: " << this->nome << endl;
        cout << "Nível: " << this->nivel << endl;
        cout << "Dano: " << this->dano << endl;
        cout << "Vida: " << this->vida << endl;
        cout << "--------------" << endl;
    }
};

int main() {
    Personagem heroi("Aragorn", 10, 25, 100);
    Personagem vilao("Orc Chefe", 8, 20, 80);

    cout << "--- INÍCIO DO COMBATE ---" << endl;
    heroi.mostrarInfo();
    vilao.mostrarInfo();

    cout << endl;

    heroi.atacar(vilao);

    cout << endl;

    cout << "--- FIM DO COMBATE ---" << endl;
    heroi.mostrarInfo();
    vilao.mostrarInfo();

    return 0;
}