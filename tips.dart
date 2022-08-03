import 'dart:math' as math;

void main() async {
  // Este es un comentario

  /*
   *  Esto es un comentario multilinea
   *  Hola de nuevo...
   */

  print('Hola Mundo');

  // Strings
  final String nombreAux = 'Tony';
  final apellido = 'Stark';

  //   nombre = 'Peter';

  print('$nombreAux $apellido');

  //   Números
  int empleados = 10;
  double salario = 1856.25;

  print(empleados);
  print(salario);

  bool? isActive = null;

  if (isActive == null) {
    print('isActive es null');
  } else {
    print('No es null');
  }

  List<int> numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  numeros.add(11);
  print(numeros);

  final masNumeros = List.generate(100, (int index) => index);

  print(masNumeros);

  //   Map persona = {
  //     'nombre': 'Fernando',
  //     'edad': 35,
  //     'soltero': false,
  //     true: false,
  //     1: 100,
  //     2: 500
  //   };

  Map<String, dynamic> persona = {
    'nombre': 'Fernando',
    'edad': 35,
    'soltero': false,
  };

  persona.addAll({'segundoNombre': 'Juan'});

  print(persona);

  final nombre = 'Fernando';

  //   saludar( nombre, 'Greetings' );
  saludar2(nombre: nombre, mensaje: 'Greetings');

  //   final ironman = new Heroe( nombre: rawJson['nombre']!, poder: rawJson['poder']! );

  final rawJson = {'nombre': 'Tony Stark', 'poder': 'Dinero'};

  final ironman = Heroe.fromJson(rawJson);

  print(ironman);

  //   final wolverine = new Heroe(nombre:'Logan', poder: 'Regeneración');
  //   print( wolverine );

  // GETTERS Y SETTERS

  final cuadrado = new Cuadrado(2);

  cuadrado.area = 100;

  print('area: ${cuadrado.calcularArea()}');

  print('lado: ${cuadrado.lado}');

  print('area get: ${cuadrado.area}');

  //CLASES ABSTRACTAS

  final perro = new Perro();
  final gato = new Gato();

  sonidoAnimal(perro);
  sonidoAnimal(gato);

  // EXTENDS

  final superman = new Heroee('Clark Kent');
  final luthor = new Villano('Lex Luthor');

  print(superman);
  print(luthor);

  // MIXINS

  final flipper = new Delfin();

  flipper.nadar();

  final batmann = new Murcielago();

  batmann.caminar();
  batmann.volar();

  //FUTURES

  print('Antes de la peticion');

  httpGet('https://api.nasa.com/aliens').then((data) {
    print(data.toLowerCase());
  });

  print('Fin del programa');

  //ASYNC / AWAIT

  print('Antes de la peticion 2');

  final data2 = await httpGet('https://api.nasa.com/aliens');

  print(data2);
  final nombre2 = await getNombre('10');

  print(nombre2);
  // getNombre('10').then( print );

  print('Fin del programa 2');
} // FIN MAIN

Future<String> getNombre(String id) async {
  return '$id - Guillermo';
}

Future<String> httpGet(String url) {
  return Future.delayed(Duration(seconds: 3), () => 'Hola Mundo - 3 segundos');
}

abstract class Mamifero extends Animal {
  int? patas;

  void emitirSonido() => print('aa');
}

abstract class Ave extends Animal {
  int? patas;

  void emitirSonido() => print('bbbb');
}

abstract class Pez extends Animal {
  int? patas;

  void emitirSonido() => print('ccc');
}

abstract class Volador {
  void volar() => print('vuela');
}

abstract class Caminante {
  void caminar() => print('camina');
}

abstract class Nadador {
  void nadar() => print('nada');
}

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Mamifero with Caminante, Volador {}

class Gato2 extends Mamifero with Caminante {}

class Paloma extends Ave with Volador, Caminante {}

class Pato extends Ave with Volador, Caminante, Nadador {}

class Tiburon extends Pez with Nadador {}

class PezVolador extends Pez with Nadador, Volador {}

abstract class Personaje {
  String? poder;
  String nombre;

  Personaje(this.nombre);

  @override
  String toString() {
    return '$nombre - $poder';
  }
}

class Heroee extends Personaje {
  int valentia = 100;

  Heroee(String nombre) : super(nombre);
}

class Villano extends Personaje {
  int maldad = 1000;

  Villano(String nombre) : super(nombre);
}

void sonidoAnimal(Animal animal) {
  animal.emitirSonido();
}

abstract class Animal {
  int? patas;

  void emitirSonido();
}

class Perro implements Animal {
  int? patas;

  void emitirSonido() => print('Guauuuuuu');
}

class Gato implements Animal {
  int? patas;
  int? cola;

  void emitirSonido() => print('Miauuuuu');
}

class Cuadrado {
  double lado; // lado x lado

  double get area {
    return this.lado * this.lado;
  }

  set area(double valor) {
    this.lado = math.sqrt(valor);
    print('set $valor');
  }

  Cuadrado(double lado) : this.lado = lado;

  double calcularArea() {
    return this.lado * this.lado;
  }
}

class Heroe {
  String nombre;
  String poder;

  Heroe({required this.nombre, required this.poder});

  Heroe.fromJson(Map<String, String> json)
      : this.nombre = json['nombre']!,
        this.poder = json['poder'] ?? 'No tiene poder';

  String toString() {
    return 'Heroe: nombre: ${this.nombre}, poder: ${this.poder}';
  }
}

void saludar(String nombre, [String mensaje = 'Hi']) {
  print('$mensaje $nombre');
}

void saludar2({
  required String nombre,
  required String mensaje,
}) {
  print('$mensaje $nombre');
}
