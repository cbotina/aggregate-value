import 'package:registro_agregado_cb/dao/student_dao.dart';
import 'package:registro_agregado_cb/model/student.dart';

class Career {
  final int id;
  final String name;
  final StudentDAO studentDAO = StudentDAO();

  Career({
    required this.id,
    required this.name,
  });

  Future<List<Student>> getStudents() async {
    return studentDAO.getCareerStudents(id);
  }

  @override
  String toString() {
    return 'Carrera{id: $id, Nombre: $name';
  }
}
