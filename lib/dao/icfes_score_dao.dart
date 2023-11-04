import 'package:registro_agregado_cb/errors/icfes_score_exceptions.dart';
import 'package:registro_agregado_cb/errors/student_exceptions.dart';
import 'package:registro_agregado_cb/facade/db_facade.dart';
import 'package:registro_agregado_cb/model/icfes_score.dart';

class IcfesScoreDAO {
  final DbFacade dbFacade = DbFacade();

  Future insertIcfesScore(int studentId, IcfesScore icfesScore) async {
    var conn = dbFacade.connect();

    return conn.insert(
      table: 'icfesscore',
      insertData: {
        'id': icfesScore.id,
        'student_id': studentId,
        'lecturascore': icfesScore.lecuraCriticaScore,
        'matematicasscore': icfesScore.matematicasScore,
        'inglesscore': icfesScore.inglesScore,
        'naturalesscore': icfesScore.naturalesScore,
        'sociudadanasscore': icfesScore.sociudadanasScore,
      },
    ).catchError((error) {
      if (error.contains('[1062]')) {
        throw IcfesScoreAlreadyExistsException();
      } else if (error.contains('[1452]')) {
        throw NotRegisteredStudentException();
      }

      throw Exception();
    }).whenComplete(() {
      conn.close();
    });
  }

  Future<IcfesScore?> getStudentIcfesScore(int studentId) async {
    var conn = dbFacade.connect();

    IcfesScore? score;

    Map row = await conn
        .getOne(table: 'icfesscore', where: {'student_id': studentId});

    if (row.isNotEmpty) {
      score = IcfesScore(
        id: row['id'],
        lecuraCriticaScore: row['lecturascore'],
        matematicasScore: row['matematicasscore'],
        sociudadanasScore: row['sociudadanasscore'],
        naturalesScore: row['naturalesscore'],
        inglesScore: row['inglesscore'],
      );
    }

    conn.close();

    return score;
  }

  Future<List<IcfesScore>> getAllIcfesScores() async {
    var conn = dbFacade.connect();

    List<dynamic> queryResults = await conn.getAll(table: 'icfesscore');

    List<IcfesScore> scores = queryResults.map(
      (e) {
        return IcfesScore(
          id: e['id'],
          lecuraCriticaScore: e['lecturascore'],
          inglesScore: e['inglesscore'],
          matematicasScore: e['matematicasscore'],
          naturalesScore: e['naturalesscore'],
          sociudadanasScore: e['sociudadanasscore'],
        );
      },
    ).toList();

    return scores;
  }

  void updateIcfesScore(IcfesScore icfesScore) {
    throw UnimplementedError();
  }

  Future deleteIcfesScore(String icfesScoreId) {
    var conn = dbFacade.connect();

    return conn.delete(
      table: 'icfesscore',
      where: {'id': icfesScoreId},
    ).catchError((error) {
      throw Exception(error);
    }).whenComplete(() {
      conn.close();
    });
  }
}
