import 'package:registro_agregado_cb/dao/icfes_score_dao.dart';
import 'package:registro_agregado_cb/model/faculty.dart';
import 'package:registro_agregado_cb/model/icfes_score.dart';

class University {
  final int id;
  final String name;
  List<Faculty> faculties;

  IcfesScoreDAO icfesScoreDAO = IcfesScoreDAO();

  University({
    required this.id,
    required this.name,
    required this.faculties,
  });

  Future registerIcfesScore(
    int studentId,
    IcfesScore icfesScore,
  ) async {
    await icfesScoreDAO.insertIcfesScore(studentId, icfesScore);
  }

  @override
  String toString() {
    return 'Universidad{id: $id, Nombre: $name, Facultades: $faculties}';
  }
}
