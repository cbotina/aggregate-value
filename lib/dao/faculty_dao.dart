import 'package:registro_agregado_cb/facade/db_facade.dart';
import 'package:registro_agregado_cb/model/faculty.dart';

class FacultyDAO {
  final DbFacade dbFacade = DbFacade();

  Future<List<Faculty>> getFaculties() async {
    var conn = dbFacade.connect();

    List<dynamic> queryResults = await conn.getAll(table: 'faculty');

    List<Faculty> faculties = queryResults.map(
      (e) {
        return Faculty(id: e['id'], name: e['name']);
      },
    ).toList();

    conn.close();

    return faculties;
  }
}
