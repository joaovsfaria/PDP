#include <iostream>

using namespace std;

int main() {
  int numNotas;
  float nota, soma = 0.0, media;

  cout << "Quantas notas voce quer inserir? ";
  cin >> numNotas;

  for (int i = 0; i < numNotas; i++) {
    cout << "Insira a nota " << i + 1 << ": ";
    cin >> nota;

    while (nota < 0 || nota > 10) {
      cout << "Nota invalida. Insira uma nota entre 0 e 10: ";
      cin >> nota;
    }

    soma += nota;
  }

  media = soma / numNotas;

  cout << "A media das notas e: " << media << endl;

  if (media >= 7.0) {
    cout << "Parabens, voce foi Aprovado!" << endl;
  } else {
    cout << "Voce foi Reprovado." << endl;
  }

  return 0;
}