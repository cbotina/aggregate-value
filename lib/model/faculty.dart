import 'package:registro_agregado_cb/model/career.dart';

class Faculty {
  final int id;
  final String name;
  List<Career> careers;

  Faculty({
    required this.id,
    required this.careers,
    required this.name,
  });

  Career? findCareerById(int id) {
    for (Career career in careers) {
      if (career.id == id) {
        return career;
      }
    }
    return null;
  }

  @override
  String toString() {
    return 'Facultad{id: $id, Nombre: $name, Carreras: $careers}';
  }
}
