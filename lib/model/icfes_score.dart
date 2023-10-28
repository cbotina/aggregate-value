class IcfesScore {
  final String id;
  final int lecuraCriticaScore;
  final int matematicasScore;
  final int sociudadanasScore;
  final int naturalesScore;
  final int inglesScore;

  IcfesScore({
    required this.id,
    required this.lecuraCriticaScore,
    required this.matematicasScore,
    required this.sociudadanasScore,
    required this.naturalesScore,
    required this.inglesScore,
  });

  @override
  String toString() {
    return 'Puntaje: {$id, '
        'Lectura Crítica: $lecuraCriticaScore, '
        'Matemáticas: $matematicasScore, '
        'Ciencias Sociales: $sociudadanasScore, '
        'Ciencias Naturales: $naturalesScore, '
        'Inglés: $inglesScore}';
  }
}
