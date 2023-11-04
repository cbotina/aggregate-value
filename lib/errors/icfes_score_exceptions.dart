class IcfesScoreAlreadyExistsException implements Exception {
  @override
  String toString() =>
      'El puntaje Icfes ingresado ya se encuentra en la base de datos';
}
