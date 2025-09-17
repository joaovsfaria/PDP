#include <iostream>

using namespace std;

float somarArray(float arr[], int tamanho) {
    float result = 0;
    for(int i = 0; i < tamanho; i++) {
        result += arr[i];
    }
    return result;
}

int main() {

int tamanho;
float aux, result;
float arr[100000];
cout << "Insira o tamanho" << endl;
cin >> tamanho;

for(int i = 0; i < tamanho; i++){
    cout << "Insira o valor " << i << " no array" << endl; 
    cin >> aux;
    arr[i] = aux;
}

result = somarArray(arr, tamanho);
cout << result;
  return 0;
}