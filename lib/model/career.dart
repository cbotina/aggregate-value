import 'package:registro_agregado_cb/model/student.dart';

class Career {
  final int id;
  final String name;
  List<Student> students;

  Career({
    required this.id,
    required this.students,
    required this.name,
  });

  Student? findStudentById(int it) {
    for (Student student in students) {
      if (student.id == id) return student;
    }
    return null;
  }

  void updateIcfesScore() {}

  @override
  String toString() {
    return 'Carrera{id: $id, Nombre: $name, Estudiantes: $students}';
  }
}
