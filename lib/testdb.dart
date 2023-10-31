import 'package:registro_agregado_cb/dao/faculty_dao.dart';

void main(List<String> arguments) {
  FacultyDAO facultyDAO = FacultyDAO();
  facultyDAO.getFaculties();
}
