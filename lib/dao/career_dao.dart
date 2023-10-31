import 'package:registro_agregado_cb/facade/db_facade.dart';
import 'package:registro_agregado_cb/model/career.dart';

class CareerDAO {
  final DbFacade dbFacade = DbFacade();

  Future<List<Career>> getFacultyCareers(int facultyId) async {
    var conn = dbFacade.connect();

    List<dynamic> queryResults = await conn.getAll(table: 'career', where: {
      'faculty_id': facultyId,
    });

    List<Career> careers = queryResults.map((e) {
      return Career(id: e['id'], name: e['name']);
    }).toList();

    conn.close();

    return careers;
  }
}
