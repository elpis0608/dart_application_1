import 'dart:math';

void main() {
  List<int> winningNumbers = [9, 19, 29, 35, 37, 38];
  print('오늘의 로또 번호 : $winningNumbers');
  var random = Random();                  // 랜덤 변수 생성
  Set<int> lotto = {};                    
  while (lotto.length < 6) {
    lotto.add(random.nextInt(45) + 1);
  }
  List<int> myNumber = lotto.toList();      
  myNumber.sort();                       //정렬
  print('발급한 로또 번호 : $myNumber');

  int match = myNumber.where((num) => winningNumbers.contains(num)).length;

  int rank;                 // if 로 조건생성
  if (match == 6) {
    rank = 1;
  } else if (match == 5) {
    rank = 2;
  } else if (match == 4) {
    rank = 3;
  } else {
    rank = 0;
  }

  rank == 0 ? print('당첨 여부 : 당첨 실패 !') : print('당첨 여부 : [${rank}등]');
  myNumber.clear();
  print('현재 발급한 로또 번호 : ${myNumber}');
}
