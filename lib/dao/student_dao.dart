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

  Future insertStudent(int careerId, Student student) async {
    var conn = dbFacade.connect();

    return conn.insert(
      table: 'student',
      insertData: {
        'id': student.id,
        'career_id': careerId,
        'name': student.name
      },
    ).catchError((error) {
      throw Exception(error);
    }).whenComplete(() {
      conn.close();
    });
  }

  Future deleteStudent(int studentId) async {
    var conn = dbFacade.connect();

    return conn.delete(
      table: 'student',
      where: {'id': studentId},
    ).catchError((error) {
      throw Exception(error);
    }).whenComplete(() {
      conn.close();
    });
  }
}
