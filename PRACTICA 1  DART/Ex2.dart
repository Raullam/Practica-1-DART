void main(List<String> args) {
  if (args.isEmpty) { // Si aarguments esta buit enviem l'avis i tanquem el programa
    print('Por favor, introeix un numero com argument.');
    return;
  }

  int n = int.parse(args[0]);    // Convertim l'argument 0 que es el que ens interesa a enter
  generaPrimers(n);              // Cridem a la funció generarPrimers()
}

void generaPrimers(int n) {
List<int> numerosPrimos = [];

  for (int i = 2; i < n; i++) {   // Busquem els numeros primers mes petits que l'argument ingresat
    if (esPrimo(i)) {             // Amb el bucle for mirem tots els nombres inferiors a l'argument
      numerosPrimos.add(i);       // i amb la funció mirem si es primer o no
    }
  }

  print("Numeros primos menors de $n:");  // Mostra els numeros primers trobats
  print(numerosPrimos);

 print("Parelles de numeros primos amb diferencia de 2:"); // Busquem i mostrem les parelles de numeros primers que la diferencia entre ells sigue de 2.
  for (int i = 0; i < numerosPrimos.length - 1; i++) {      // Aquí s'examina si la diferència entre el nombre primer actual  és exactament 2.
    if (numerosPrimos[i + 1] - numerosPrimos[i] == 2) {     //  Si la condició és certa, vol dir que hem trobat una parella de nombres primers
      print("(${numerosPrimos[i]}, ${numerosPrimos[i + 1]})"); // i l'impirmim
    }
  }
}


bool esPrimo(int num) { // Funció que ens diu si un valor int es un numero primer i ens retorna true o false
  if (num < 2) return false;
  for (int i = 2; i * i <= num; i++) {
    if (num % i == 0) return false;
  }
  return true;
}


