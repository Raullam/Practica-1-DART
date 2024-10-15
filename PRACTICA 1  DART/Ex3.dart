import 'dart:math';

// Classe Client
class Client {
  String _dni; //  _ Per que es privada
  String nom, correu, telefon, numeroTargeta; 


// Constructors
  Client(this._dni, this.nom, {this.correu = '', this.telefon = '', this.numeroTargeta = ''});

  Client.tot(this._dni, this.nom, this.correu, this.telefon, this.numeroTargeta);

// Metodes get
  String get dni => _dni;
  String get getNom => nom;
  String get getCorreu => correu;
  String get getTelefon => telefon;
  String get getNumTargeta => numeroTargeta;

// Metodes set
  set setDni(String DNI) => this._dni = dni;
  set setNom(String nom) => this.nom = nom;
  set setCorreu(String correu) => this.correu = correu;
  set setTelefon(String telefon) => this.telefon = telefon;
  set setNumTargeta(String numTargeta) => this.numeroTargeta = numeroTargeta;

// Metode toString
  @override
  String toString() {
    return 'DNI: $_dni, Nom: $nom, Correu: $correu, Telefon: $telefon, Targeta: $numeroTargeta';
  }
}

// Classe abstracta Vehicle
abstract class Vehicle {
  String matricula, marca, model;
  bool estaLlogat;
  late String llogatPer;
  int quilometratge;

/////borrar constructors
  // Constructors
  Vehicle.buit() 
      : matricula = '', 
        marca = '', 
        model = '', 
        estaLlogat = false, 
        llogatPer = '', // Inicialización de llogatPer
        quilometratge = 0; // Constructor per defecte sense atributs

  Vehicle.matricula(this.matricula) 
      : marca = '', 
        model = '', 
        estaLlogat = false, 
        llogatPer = '', // Inicialización de llogatPer
        quilometratge = 0; // Constructor amb matrícula

  Vehicle.full(this.matricula, this.marca, this.model, this.estaLlogat, this.llogatPer, this.quilometratge); // Constructor amb tots els atributs

  Vehicle(this.matricula, this.marca, this.model)
      : estaLlogat = false,
        quilometratge = 0;

 // Getters
  String get getMatricula => matricula;
  String get getMarca => marca;
  String get getModel => model;
  bool get getEstaLlogat => estaLlogat;
  String get getLlogatPer => llogatPer;
  int get getQuilometratge => quilometratge;

  // Setters
  set setMatricula(String value) => matricula = value;
  set setMarca(String value) => marca = value;
  set setModel(String value) => model = value;
  set setEstaLlogat(bool value) => estaLlogat = value;
  set setLlogatPer(String value) => llogatPer = value;
  set setQuilometratge(int value) => quilometratge = value;


  void llogar(String dni) {
    estaLlogat = true;
    llogatPer = dni;
  }

  void retornar() {
    estaLlogat = false;
    //llogatPer = '';
  }
//////////////////////////////////////////////
  bool estaLlogatStatus() => estaLlogat;
  

int compareTo(Vehicle other) {
    if (this.runtimeType != other.runtimeType) {
      throw Exception("No es poden comparar vehicles de tipus diferent.");
    }
    return this.quilometratge.compareTo(other.quilometratge);
  }

 @override
String toString() {
  String estatLlogat = estaLlogat ? 'Llogat per: $llogatPer' : 'Anteriorment llogat per: $llogatPer';
  return 'Cotxe: $marca $model, Matricula: $matricula, Llogat: $estaLlogat, $estatLlogat, Quilometratge: $quilometratge';
}

}


// Classe Cotxe
class Cotxe extends Vehicle {
  Cotxe({String matricula = '', String marca = '', String model = ''}) : super(matricula, marca, model);

  @override
String toString() {
  return 'Cotxe: ${super.toString()}';
}
}


// Classe Moto
class Moto extends Vehicle {
  int cilindrada;

  Moto({String matricula = '', String marca = '', String model = '', this.cilindrada = 0}) : super(matricula, marca, model);

  @override
String toString() {
  return 'Moto: ${super.toString()}, Cilindrada: $cilindrada';
}
}

// Classe ServeiLloguer
class ServeiLloguer {
  List<Cotxe> cotxes = [];
  List<Moto> motos = [];

  void afegirCotxe(Cotxe cotxe) => cotxes.add(cotxe);
  void afegirMoto(Moto moto) => motos.add(moto);

  void llogarCotxe(String matricula, String dni) {
    for (var cotxe in cotxes) {
      if (cotxe.matricula == matricula && !cotxe.estaLlogat) {
        cotxe.llogar(dni);
        print('\nCotxe llogat: ${cotxe.toString()}');
        return;
      }
    }
    print('Cotxe no disponible per llogar.');
  }

  void retornarCotxe(String matricula) {
  for (var cotxe in cotxes) {
    if (cotxe.matricula == matricula && cotxe.estaLlogat) {
      int quilometresRecorreguts = Random().nextInt(451) + 50; // Generar un valor aleatori entre 50 i 500
      cotxe.quilometratge += quilometresRecorreguts;
      cotxe.retornar();
      print('\nCotxe retornat: ${cotxe.toString()}');
      print('Quilòmetres recorreguts durant el lloguer: $quilometresRecorreguts');
      return;
    }
  }
  print('\nCotxe no estava llogat.');
}
void llogarMoto(String matricula, String dni) {
  for (var moto in motos) {
    if (moto.matricula == matricula && !moto.estaLlogat) {
      moto.llogar(dni);
      print('\nMoto llogada: ${moto.toString()}');
      return;
    }
  }
  print('Moto no disponible per llogar.');
}
void retornarMoto(String matricula) {
  for (var moto in motos) {
    if (moto.matricula == matricula && moto.estaLlogat) {
      int quilometresRecorreguts = Random().nextInt(451) + 50; // Genera entre 50 i 500 km
      moto.quilometratge += quilometresRecorreguts;
      moto.retornar();
      print('\nMoto retornada: ${moto.toString()}');
      print('Quilòmetres recorreguts durant el lloguer: $quilometresRecorreguts');
      return;
    }
  }
  print('Moto no estava llogada.');
}

  int comptarCotxesLlogats() => cotxes.where((cotxe) => cotxe.estaLlogat).length;
  int comptarMotosLlogades() => motos.where((moto) => moto.estaLlogat).length;

  Vehicle cotxeAmbMesQuilometres() {
    return cotxes.reduce((actual, seguent) => actual.quilometratge > seguent.quilometratge ? actual : seguent);
  }

  Vehicle motoAmbMesQuilometres() {
    return motos.reduce((actual, seguent) => actual.quilometratge > seguent.quilometratge ? actual : seguent);
  }
}

// Aplicació Executable
void main() {
  ServeiLloguer serveiLloguer = ServeiLloguer();

  // Crear cotxes
  serveiLloguer.afegirCotxe(Cotxe(matricula: 'ABC123', marca: 'Toyota', model: 'Corolla'));
  serveiLloguer.afegirCotxe(Cotxe(matricula: 'XYZ789', marca: 'Ford', model: 'Focus'));
  serveiLloguer.afegirCotxe(Cotxe(matricula: 'LMN456', marca: 'Honda', model: 'Civic'));
  serveiLloguer.afegirCotxe(Cotxe(matricula: 'RST234', marca: 'BMW', model: 'X3'));
  serveiLloguer.afegirCotxe(Cotxe(matricula: 'JKL678', marca: 'Mercedes', model: 'A-Class'));

  // Crear motos
  serveiLloguer.afegirMoto(Moto(matricula: 'MOT123', marca: 'Yamaha', model: 'R1', cilindrada: 1000));
  serveiLloguer.afegirMoto(Moto(matricula: 'MOT456', marca: 'Kawasaki', model: 'Ninja', cilindrada: 800));
  serveiLloguer.afegirMoto(Moto(matricula: 'MOT789', marca: 'Ducati', model: 'Panigale', cilindrada: 1100));
  serveiLloguer.afegirMoto(Moto(matricula: 'MOT321', marca: 'Honda', model: 'CBR', cilindrada: 600));
  serveiLloguer.afegirMoto(Moto(matricula: 'MOT654', marca: 'Suzuki', model: 'GSX', cilindrada: 750));

  // Crear clients
  Client client1 = Client('12345678A', 'John Doe', correu: 'john@example.com', telefon: '123456789', numeroTargeta: '1234-5678-9101-1121');
  Client client2 = Client('87654321B', 'Jane Smith', correu: 'jane@example.com', telefon: '987654321', numeroTargeta: '2121-1098-7654-3210');

  // Llogar vehicles
// Llogar vehicles (10 lloguers)
serveiLloguer.llogarCotxe('JKL678', client1.dni);  // Client 1 lloga un Mercedes A-Class
serveiLloguer.llogarCotxe('ABC123', client1.dni);  // Client 1 lloga un Toyota Corolla
serveiLloguer.llogarCotxe('XYZ789', client2.dni);  // Client 2 lloga un Ford Focus
serveiLloguer.llogarCotxe('RST234', client1.dni);  // Client 1 lloga un BMW X3
serveiLloguer.llogarCotxe('LMN456', client2.dni);  // Client 2 lloga un Honda Civic
serveiLloguer.llogarMoto('MOT789', client1.dni);   // Client 1 lloga una Ducati Panigale
serveiLloguer.llogarMoto('MOT321', client2.dni);   // Client 2 lloga una Honda CBR
serveiLloguer.llogarMoto('MOT123', client1.dni);   // Client 1 lloga una Yamaha R1
serveiLloguer.llogarMoto('MOT456', client2.dni);   // Client 2 lloga una Kawasaki Ninja
serveiLloguer.llogarMoto('MOT654', client2.dni);   // Client 2 lloga una Suzuki GSX

  // Retornar vehicles
// Retornar alguns vehicles
serveiLloguer.retornarCotxe('ABC123');  // Retornar el Toyota Corolla
serveiLloguer.retornarCotxe('RST234');  // Retornar el BMW X3
serveiLloguer.retornarCotxe('LMN456');  // Retornar el Honda Civic
serveiLloguer.retornarMoto('MOT123');   // Retornar la Yamaha R1
serveiLloguer.retornarMoto('MOT456');   // Retornar la Kawasaki Ninja
serveiLloguer.retornarCotxe('LMN456');  // Retornar el Honda Civic

print("\nInformació Rent a car");

  // Comptar vehicles llogats
  int cotxesLlogatsCount = serveiLloguer.comptarCotxesLlogats();
  int motosLlogadesCount = serveiLloguer.comptarMotosLlogades();

  print('Total cotxes llogats: $cotxesLlogatsCount');
  print('Total motos llogades: $motosLlogadesCount');

  // Mostrar el cotxe i moto amb més quilòmetres
  print('Cotxe amb més quilòmetres: ${serveiLloguer.cotxeAmbMesQuilometres()}');
  print('Moto amb més quilòmetres: ${serveiLloguer.motoAmbMesQuilometres()}');
}
