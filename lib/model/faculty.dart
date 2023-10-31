import 'package:registro_agregado_cb/dao/career_dao.dart';
import 'package:registro_agregado_cb/model/career.dart';

class Faculty {
  final int id;
  final String name;
  final CareerDAO careerDAO = CareerDAO();

  Faculty({
    required this.id,
    required this.name,
  });

  Future<List<Career>> getCareers() async {
    return careerDAO.getFacultyCareers(id);
  }

  @override
  String toString() {
    return 'Facultad{id: $id, Nombre: $name';
  }
}
