import 'package:registro_agregado_cb/dao/faculty_dao.dart';
import 'package:registro_agregado_cb/model/career.dart';
import 'package:registro_agregado_cb/model/faculty.dart';
import 'package:registro_agregado_cb/model/student.dart';

class University {
  final String name;
  final FacultyDAO facultyDAO = FacultyDAO();

  University({
    required this.name,
  });

  Future<Student?> findStudentById(int studentId) async {
    Student? foundStudent;
    for (Faculty faculty in await getFaculties()) {
      for (Career career in await faculty.getCareers()) {
        for (Student student in await career.getStudents()) {
          if (student.id == studentId) {
            foundStudent = student;
          }
        }
      }
    }
    return foundStudent;
  }

  Future<List<Faculty>> getFaculties() async {
    return facultyDAO.getFaculties();
  }

  @override
  String toString() {
    return 'Universidad{Nombre: $name}';
  }
}
