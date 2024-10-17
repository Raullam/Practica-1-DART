void main(List<String> args) { // Converteim els arguments de llista de string a enters.
  int hores = int.parse(args[0]);
  int minuts = int.parse(args[1]);
  int segons = int.parse(args[2]);

  imprimirHoraFormat(hores, minuts, segons); // Executem la funció imprimirHoraFormat amb els arguments ja pasats a int
}

void imprimirHoraFormat(int hores, int minuts, int segons) {  // Comprovem que els valors de l'hora són vàlids (entre 0-23 per hores).
  if (hores < 0 || minuts < 0 || segons < 0 || hores > 23) {
    print("Error: Nomes es permeten numeros enters positius entre 00:00:00 i 23:59:59");
    return;
  }

  minuts += segons ~/ 60;    // Aquest bloc de codi ajusta els minuts i segons: els segons que superen 59 s'afegeixen als minuts (segons ~/ 60),  
  segons %= 60;              // i després els segons es redueixen al rang de 0 a 59 (segons %= 60). El mateix s'aplica als minuts: els minuts que superen 59
  hores += minuts ~/ 60;     // s'afegeixen a les hores (minuts ~/ 60), i els minuts es redueixen al rang de 0 a 59 (minuts %= 60).
  minuts %= 60;              
  
  if (hores >= 24 ) {
    print("Error: Les hores no poden superar les 23 hores "); // Per si acas ingressen molts segons i/o minuts afegim aquest avis

  }else { 
    // Si va tot be converteix les variables hores, minuts, i segons a tipus String i les formata amb zeros a l'esquerra 
    //perquè sempre tinguin dos dígits (padLeft(2, '0')). Despres concatenem els valors formatejats en un sol String amb el format "HH:MM:SS"
    // i els imprimim per consola.
    print("${hores.toString().padLeft(2, '0')}:${minuts.toString().padLeft(2, '0')}:${segons.toString().padLeft(2, '0')}");
  }
}



