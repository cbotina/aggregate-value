import 'package:registro_agregado_cb/model/icfes_score.dart';

class Student {
  final int id;
  final String name;
  IcfesScore? icfesScore;

  Student({required this.id, required this.name});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Student && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'Estudiante{id: $id, Nombre: $name, Puntaje Icfes: $icfesScore}';
  }
}
