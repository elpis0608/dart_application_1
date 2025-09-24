void main() {
  List<String> cart = ["티셔츠", "바지", "모자", "티셔츠", "바지"];
  int total = 0;                     // 합계 금액 넣을 int 타입 변수 생성

  for (var item in cart) {              //for in사용
    if (item == '티셔츠') {
      total += 10000;
    } else if (item == '바지') {
      total += 8000;
    } else if (item == '모자') {
      total += 4000;
    }
  }
  print('장바구니에 $total원 어치를 담으셨네요 !');
  int discount = (total / 10).toInt();           //할인금액
  int finalprice = total - discount;             //최종금액
  print('할인 금액 : $discount원');
  print('최종적으로 결제하실 금액은 $finalprice원 입니다 !');
}
