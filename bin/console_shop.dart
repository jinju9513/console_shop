import 'package:console_shop/console_shop.dart' as console_shop;
import 'dart:io';
import 'console_shop_class.dart';


void main(List<String> arguments) {
  // 객체 생성
  ShoppingMall mall = ShoppingMall([
    Product('셔츠', 45000),
    Product('원피스', 30000),
    Product('반팔티', 35000),
    Product('반바지', 38000),
    Product('양말', 5000),
  ], 0);

  bool isRunning = true;

  while (isRunning) {
    print(
      '--------------------------------------------------------------------------------------------------------------------------------',
    );
    print(
      '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료 / [6] 장바구니 초기화',
    );
    print(
      '--------------------------------------------------------------------------------------------------------------------------------',
    );
    String? entry = stdin.readLineSync();
    switch (entry) {
      case '1':
        mall.showProducts();
        break;
      case '2':
        mall.addToCart();
        break;
      case '3':
        mall.showTotal();
        break;
      case '4':
        print('정말 종료하시겠습니까? 종료하시려면 5를 입력해주세요!');
        String? confirmExit = stdin.readLineSync();
        if (confirmExit == '5') {
          print('이용해 주셔서 감사합니다~ 안녕히 가세요!');
          isRunning = false; //루프 종료
        } else {
          print('종료하지 않습니다.');
        }
        break;
      case '6':
        mall.clearCart();
        break;
      default:
        print('지원하지 않는 기능입니다! 다시 시도해주세요 ...');
        break;
    }
  }
}
