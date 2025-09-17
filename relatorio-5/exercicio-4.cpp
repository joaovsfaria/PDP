#include <iostream>

using namespace std;

double celsiusParaFahrenheit(double celsius) {
  return (celsius * 9.0 / 5.0) + 32.0;
}

double celsiusParaKelvin(double celsius) {
  return celsius + 273.15;
}

int main() {
  int opcao;
  double temperatura;

  do {
    cout << "Menu de Conversao de Temperatura" << endl;
    cout << "1. Converter Celsius para Fahrenheit" << endl;
    cout << "2. Converter Celsius para Kelvin" << endl;
    cout << "3. Sair" << endl;
    cout << "Digite sua opcao: ";
    cin >> opcao;

    switch (opcao) {
      case 1:
        cout << "Digite a temperatura em Celsius: ";
        cin >> temperatura;
        cout << temperatura << " Celsius e igual a " << celsiusParaFahrenheit(temperatura) << " Fahrenheit." << endl;
        break;
      case 2:
        cout << "Digite a temperatura em Celsius: ";
        cin >> temperatura;
        cout << temperatura << " Celsius e igual a " << celsiusParaKelvin(temperatura) << " Kelvin." << endl;
        break;
      case 3:
        cout << "Saindo do programa. Ate mais!" << endl;
        break;
      default:
        cout << "Opcao invalida. Por favor, escolha uma opcao de 1 a 3." << endl;
        break;
    }

    cout << endl;
  } while (opcao != 3);

  return 0;
}