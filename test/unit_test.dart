import 'package:registro_agregado_cb/dao/icfes_score_dao.dart';
import 'package:registro_agregado_cb/dao/student_dao.dart';
import 'package:registro_agregado_cb/errors/icfes_score_exceptions.dart';
import 'package:registro_agregado_cb/errors/student_exceptions.dart';
import 'package:registro_agregado_cb/model/icfes_score.dart';
import 'package:registro_agregado_cb/model/student.dart';
import 'package:test/test.dart';

void main() {
  StudentDAO studentDAO = StudentDAO();
  IcfesScoreDAO icfesScoreDAO = IcfesScoreDAO();

  late Student existingStudent;
  late Student existingStudentTwo;

  setUp(() async {
    existingStudent = Student(id: 99999, name: 'Bob');
    existingStudentTwo = Student(id: 88888, name: 'Alice');
    await studentDAO.insertStudent(1, existingStudent);
    await studentDAO.insertStudent(1, existingStudentTwo);
  });

  tearDown(() async {
    await icfesScoreDAO.deleteIcfesScore('ICFES2023');
    await studentDAO.deleteStudent(99999);
    await studentDAO.deleteStudent(88888);
  });

  group('Testing', () {
    group('When the user exists in the database', () {
      test('it should insert the icfes score', () async {
        final allBeforeInsertion = await icfesScoreDAO.getAllIcfesScores();

        IcfesScore score = IcfesScore(
          id: 'ICFES2023',
          lecuraCriticaScore: 85,
          matematicasScore: 75,
          sociudadanasScore: 56,
          naturalesScore: 45,
          inglesScore: 85,
        );

        await existingStudent.registerIcfesScore(score);

        final allAfterInsertion = await icfesScoreDAO.getAllIcfesScores();

        expect(allAfterInsertion, [...allBeforeInsertion, score]);
      });
    });

    group("When the user doesn't exist in the database", () {
      test('it should throw a NotRegisteredStudentException', () async {
        Student unRegisteredStudent = Student(id: 0, name: 'Craig');

        IcfesScore score = IcfesScore(
          id: 'ICFES2023',
          lecuraCriticaScore: 85,
          matematicasScore: 75,
          sociudadanasScore: 56,
          naturalesScore: 45,
          inglesScore: 85,
        );

        expect(
          unRegisteredStudent.registerIcfesScore(score),
          throwsA(isA<NotRegisteredStudentException>()),
        );

        final allBeforeInsertion = await icfesScoreDAO.getAllIcfesScores();
        final allAfterInsertion = await icfesScoreDAO.getAllIcfesScores();
        expect(allAfterInsertion, allBeforeInsertion);
      });
    });

    group('When a user already has a icfes score in the database', () {
      test('it should throw a IcfesScoreAlreadyExistsException', () async {
        IcfesScore score = IcfesScore(
          id: 'ICFES2023',
          lecuraCriticaScore: 85,
          matematicasScore: 75,
          sociudadanasScore: 56,
          naturalesScore: 45,
          inglesScore: 85,
        );

        await existingStudent.registerIcfesScore(score);

        expect(
          existingStudent.registerIcfesScore(score),
          throwsA(isA<IcfesScoreAlreadyExistsException>()),
        );

        final allBeforeInsertion = await icfesScoreDAO.getAllIcfesScores();
        final allAfterInsertion = await icfesScoreDAO.getAllIcfesScores();
        expect(allAfterInsertion, allBeforeInsertion);
      });
    });

    group('When the icfes score id is already in the database', () {
      test('it should throw a IcfesScoreAlreadyExistsException', () async {
        IcfesScore score = IcfesScore(
          id: 'ICFES2023',
          lecuraCriticaScore: 85,
          matematicasScore: 75,
          sociudadanasScore: 56,
          naturalesScore: 45,
          inglesScore: 85,
        );

        await existingStudent.registerIcfesScore(score);

        expect(
          existingStudentTwo.registerIcfesScore(score),
          throwsA(isA<IcfesScoreAlreadyExistsException>()),
        );

        final allBeforeInsertion = await icfesScoreDAO.getAllIcfesScores();
        final allAfterInsertion = await icfesScoreDAO.getAllIcfesScores();
        expect(allAfterInsertion, allBeforeInsertion);
      });
    });
  });
}
