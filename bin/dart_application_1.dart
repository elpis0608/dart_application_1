import 'dart:io';
import 'dart:convert';
import 'package:dart_application_1/score.dart';

void main() {
  final students = loadStudentData('students.txt');
  if (students.isEmpty) {
    return;
  }

  StudentScore? selected;
  while (selected == null) {
    stdout.write('어떤 학생의 점수를 확인하시겠습니까? ');
    final input = stdin.readLineSync(encoding: utf8);
    if (input == null || input.isEmpty) continue;

    final match = students.where((s) => s.name == input).toList();
    if (match.isNotEmpty) {
      selected = match.first;
      selected.showinfo();

      saveResults('result.txt', '이름: ${selected.name}, 점수: ${selected.score}');
    } else {
      print('잘못된 학생 이름입니다. 다시 입력해주세요.');
    }
  }
}
