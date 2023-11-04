class NotRegisteredStudentException implements Exception {
  @override
  String toString() => 'El estudiante ingresado no existe en la base de datos';
}
