import 'dart:io';

class Score {
  int score;
  Score(this.score);

  void showinfo() {
    print('점수 : $score');
  }
}

class StudentScore extends Score {
  String name;
  StudentScore(this.name, int score) : super(score);

  @override
  void showinfo() {
    print('이름 : $name, 점수 : $score');
  }
}

List<StudentScore> loadStudentData(String filePath) {
  final students = <StudentScore>[];
  try {
    final file = File(filePath);
    final lines = file.readAsLinesSync();

    for (var line in lines) {
      final parts = line.split(',');
      if (parts.length != 2) throw FormatException('잘못된 데이터 형식: $line');

      String name = parts[0].trim();
      int score = int.parse(parts[1].trim());
      students.add(StudentScore(name, score));
    }
  } catch (e) {
    print("학생 데이터를 불러오는 데 실패했습니다: $e");
    exit(1);
  }
  return students;
}

