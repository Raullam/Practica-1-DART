void main(List<String> args) {
  if (args.isEmpty) {
    print('Por favor, introeix un numero com argument.');
    return;
  }

  // Convertir el argumento a entero
  int n = int.parse(args[0]);
  
  // Llamar a la función con el valor obtenido
  generaPrimers(n);
}

void generaPrimers(int n) {
  List<int> numerosPrimos = [];

  // Encontrar y almacenar los números primos en la lista
  for (int i = 2; i < n; i++) {
    if (esPrimo(i)) {
      numerosPrimos.add(i);
    }
  }

  // Mostrar los números primos encontrados
  print("Numeros primos menors de $n:");
  print(numerosPrimos);

  // Encontrar y mostrar las parejas de números primos cuya diferencia sea 2
  print("Parelles de numeros primos amb diferencia de 2:");
  for (int i = 0; i < numerosPrimos.length - 1; i++) {
    if (numerosPrimos[i + 1] - numerosPrimos[i] == 2) {
      print("(${numerosPrimos[i]}, ${numerosPrimos[i + 1]})");
    }
  }
}

bool esPrimo(int num) {
  if (num < 2) return false;
  for (int i = 2; i * i <= num; i++) {
    if (num % i == 0) return false;
  }
  return true;
}


