void main() {
  int score = 84;
  String result;

  if (score < 0 || score > 100) {
    result = '점수 오류';
  } else if (score >= 90) {
    result = 'A';
  } else if (score >= 80) {
    result = 'B';
  } else {
    result = 'C';
  }
  print(
    result == '점수 오류' ? result : '이 학생의 점수는 $score점 이며, 등급은 $result등급 입니다.'
  );
}