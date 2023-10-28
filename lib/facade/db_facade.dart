import 'package:mysql_utils/mysql_utils.dart';

class DbFacade {
  late MysqlUtils conn;

  MysqlUtils connect() {
    conn = MysqlUtils(
      settings: {
        'host': 'localhost',
        'port': 3306,
        'user': 'root',
        'password': 'delunoalnueve',
        'db': 'umariana',
        'maxConnections': 10,
        'secure': false,
        'prefix': '',
        'pool': true,
        'collation': 'utf8mb4_general_ci',
        'sqlEscape': true,
      },
    );
    return conn;
  }

  void close() {
    conn.close();
  }

  void createTables() async {
    connect();
    await conn.query(
      '''
        create table if not exists faculty(
        id INT auto_increment,
          name VARCHAR(150),
          primary key(id)
      );

      create table if not exists career(
        id INT auto_increment,
          faculty_id int,
          name VARCHAR(150),
          primary key(id),
          foreign key(faculty_id) references faculty(id)
      );


      create table if not exists student(
        id INT,
          career_id int,
          name VARCHAR(150),
          primary key(id),
          foreign key(career_id) references career(id)
      );

      create table if not exists icfesscore(
        id VARCHAR(150),
          student_id int,
          career_id int,
          lecturascore int,
          matematicasscore int,
          inglesscore int,
          naturalesscore int,
          sociudadanasscore int,
          primary key(id),
          foreign key(student_id) references student(id)
      );
      ''',
    );

    close();
  }

  void insertTestValues() async {
    connect();
    await conn.query(
      '''
        insert into faculty(name) values("Facultad Ingenieria");
        insert into career(faculty_id, name) values
        (1, "Ingenieria de Sistemas");
        insert into student(id, career_id, name) values
        (1004234727, 1, "Carlos Botina"),
        (1085203948, 1, "Santiago Ortiz"),
        (1080249789, 1, "Eve Cordoba");
      ''',
    );

    close();
  }
}
