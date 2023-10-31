import 'package:registro_agregado_cb/facade/db_facade.dart';
import 'package:registro_agregado_cb/model/student.dart';

class StudentDAO {
  final DbFacade dbFacade = DbFacade();

  Future<List<Student>> getCareerStudents(int careerId) async {
    var conn = dbFacade.connect();

    List<dynamic> queryResults = await conn.getAll(table: 'student', where: {
      'career_id': careerId,
    });

    List<Student> students = queryResults.map((e) {
      return Student(id: e['id'], name: e['name']);
    }).toList();

    conn.close();

    return students;
  }
}
