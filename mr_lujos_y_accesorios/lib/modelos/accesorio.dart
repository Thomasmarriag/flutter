import 'dart:convert';

class Accesorio {
  final int id;
  final String foto;
  final String nombre;
  final String marca;
  final String modelo;
  final int precio;

  Accesorio({
    required this.id,
    required this.foto,
    required this.nombre,
    required this.marca,
    required this.modelo,
    required this.precio,
  });

  factory Accesorio.fromJson(Map<String, dynamic> json) {
    return Accesorio(
      id: json['id'],
      foto: json['foto'],
      nombre: json['nombre'],
      marca: json['marca'],
      modelo: json['modelo'],
      precio: json['precio']
    );
  }
}

List<Accesorio> accesorioFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Accesorio>.from(jsonData.map((item) => Accesorio.fromJson(item)));
}
