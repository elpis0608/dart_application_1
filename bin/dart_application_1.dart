import 'dart:io';
import 'dart:convert';
import 'package:dart_application_1/score.dart';

String sanitize(String s) => s.trim().replaceAll('\uFEFF', '');

void saveResults(String filePath, String content) {
  try {
    final file = File(filePath);
    file.writeAsStringSync(content, encoding: utf8);
    print('저장이 완료되었습니다.');
  } catch (e) {
    print('저장에 실패했습니다: $e');
  }
}

void main() {
  final file = File('students.txt');
  if (!file.existsSync()) {
    stderr.writeln('students.txt를 찾을 수 없습니다. 현재 경로: ${Directory.current.path}');
    exit(1);
  }

  final lines = file.readAsLinesSync(encoding: utf8);

  final students = <StudentScore>[];
  for (final raw in lines) {
    final line = sanitize(raw);
    if (line.isEmpty) continue;

    final parts = line.split(',');
    if (parts.length != 2) {
      stderr.writeln('잘못된 데이터 형식: $line');
      continue;
    }

    final name = sanitize(parts[0]);
    final score = int.parse(sanitize(parts[1]));
    students.add(StudentScore(name, score));
  }

  if (students.isEmpty) {
    stderr.writeln('학생 데이터가 비어있습니다.');
    exit(1);
  }

  StudentScore? selected;
  while (selected == null) {
    stdout.write('어떤 학생의 통계를 확인하시겠습니까? ');
    var input = stdin.readLineSync(encoding: utf8);
    if (input == null) continue;

    input = sanitize(input);

    final match = students.where((s) => sanitize(s.name) == input).toList();
    if (match.isNotEmpty) {
      selected = match.first;
      selected.showinfo();
    } else {
      print('잘못된 학생 이름을 입력하셨습니다. 다시 입력해주세요.');
    }
  }
  final content = '이름 : ${selected.name}, 점수 : ${selected.score}';
  saveResults('result.txt', content);
}
