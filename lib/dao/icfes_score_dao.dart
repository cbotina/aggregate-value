import 'package:registro_agregado_cb/facade/db_facade.dart';
import 'package:registro_agregado_cb/model/icfes_score.dart';

class IcfesScoreDAO {
  final DbFacade dbFacade = DbFacade();

  Future insertIcfesScore(int studentId, IcfesScore icfesScore) async {
    var conn = dbFacade.connect();

    return conn.insert(table: 'icfesscore', insertData: {
      'id': icfesScore.id,
      'student_id': studentId,
      'lecturascore': icfesScore.lecuraCriticaScore,
      'matematicasscore': icfesScore.matematicasScore,
      'inglesscore': icfesScore.inglesScore,
      'naturalesscore': icfesScore.naturalesScore,
      'sociudadanasscore': icfesScore.sociudadanasScore,
    }).catchError((error) {
      if (error.contains('[1062]')) {
        throw Exception(
          'Error: El registro ingresado ya se encuentra en la base de datos',
        );
      } else if (error.contains('[1452]')) {
        throw Exception(
          'El estudiante ingresado no existe en la base de datos',
        );
      }

      return 0;
    }).whenComplete(() {
      conn.close();
    });
  }

  IcfesScore getIcfesScore(int icfesScoreId) {
    throw UnimplementedError();
  }

  void updateIcfesScore(IcfesScore icfesScore) {
    throw UnimplementedError();
  }

  void deleteIcfesScore(int icfesScoreId) {
    throw UnimplementedError();
  }
}
