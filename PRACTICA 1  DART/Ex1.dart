void main(List<String> args) {
  int hores = int.parse(args[0]);
  int minuts = int.parse(args[1]);
  int segons = int.parse(args[2]);

  imprimirHoraFormat(hores, minuts, segons);
}

void imprimirHoraFormat(int hores, int minuts, int segons) {
  if (hores < 0 || minuts < 0 || segons < 0 || hores > 23) {
    print("Error: Nomes es permeten numeros enters positius entre 00:00:00 i 23:59:59");
    return;
  }

  minuts += segons ~/ 60;
  segons %= 60;
  hores += minuts ~/ 60;
  minuts %= 60;
  
  if (hores >= 24 ) {
    print("Error: Les hores no poden superar les 23 hores ");

  }else {
    print("${hores.toString().padLeft(2, '0')}:${minuts.toString().padLeft(2, '0')}:${segons.toString().padLeft(2, '0')}");
  }

}

// void main(List<String> args) {
//   int hores = int.parse(args[0]);
//   int minuts = int.parse(args[1]);
//   int segons = int.parse(args[2]);

//   imprimirHoraFormat(hores, minuts, segons);
// }

// void imprimirHoraFormat(int hores, int minuts, int segons) {
//   if (hores < 0 || minuts < 0 || segons < 0) {
//     print("Error: \tNomes es permeten numeros enters positiu format hora-minut-segon entre ( 00:00:00 a 23:59:59 )");
//     return;
//   }
//   if (segons >= 60) {
//     minuts += segons ~/ 60; 
//     segons = segons % 60; 
//   }

//   if (minuts >= 60) {
//     hores += minuts ~/ 60; 
//     minuts = minuts % 60;
//   }

//   if (hores > 23) {
//     print("inputError");
//   } else {

//     String horaFormatada = 
//         "${hores.toString().padLeft(2, '0')}:${minuts.toString().padLeft(2, '0')}:${segons.toString().padLeft(2, '0')}";
//     print(horaFormatada);
//   }
// }



