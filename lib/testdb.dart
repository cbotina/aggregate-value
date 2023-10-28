import 'package:registro_agregado_cb/dao/icfes_score_dao.dart';

import 'package:registro_agregado_cb/model/icfes_score.dart';

void main(List<String> arguments) {
  IcfesScoreDAO icfesScoreDAO = IcfesScoreDAO();
  icfesScoreDAO.insertIcfesScore(
    1004234727,
    IcfesScore(
      id: '12345',
      lecuraCriticaScore: 56,
      matematicasScore: 36,
      sociudadanasScore: 76,
      naturalesScore: 89,
      inglesScore: 89,
    ),
  );
}
