import 'package:console_shop/console_shop.dart' as console_shop;
import 'dart:io';
import 'console_shop_class.dart';


// class ShoppingMall {
//   // 속성 (필드)
//   List<Product> productList;
//   List<CartItem> cartList = [];
//   int total;

//   // 생성자 (객체 생성할 때 실행됨)
//   ShoppingMall(this.productList, this.total);

//   // 메서드
//   // 상품목록 출력
//   void showProducts() {
//     print("상품 목록 출력 중...");
//     for (var product in productList) {
//       print(product);
//     }
//   }

//   // 상품 장바구니에 담는 메서드
//   void addToCart() {
//     print('상품 이름을 입력해 주세요.');
//     String? productName = stdin.readLineSync();

//     if (productName == null || productName.isEmpty) {
//       //입력값이 비었거나 아무것도 입력하지 않으면 메세지 출력 후 함수 종료
//       print('입력값이 올바르지 않아요!');
//       return;
//     }

//     bool exist = productList.any(
//       (product) => product.productName == productName,
//     );
//     //productList를 순회하면서 입력한 productName과 같은 이름이 있는지 확인한다. 있으면 true 아니면 false 반환

//     if (!exist) {
//       //exist에 없는 상품을 입력하면 메세지 입력 후 return
//       print('입력값이 올바르지 않아요!');
//       return;
//     }

//     Product selectProduct = productList.firstWhere(
//       (Product) => Product.productName == productName,
//     );
//     //productList에서 product.productName == productName 조건을 만족하는 첫번째 상품을 selectProduct에 저장
//     print('상품 개수를 입력해주세요.');
//     String? quantityInput = stdin.readLineSync(); //상품개수 입력받기

//     try {
//       int quantity = int.parse(
//         quantityInput ?? "0",
//       ); //quantityInput을 int로 형변환  null일 경우를 대비해 "0"으로 처리
//       if (quantity <= 0) {
//         print('0개보다 많은 개수의 상품만 담을 수 있어요!');
//         return;
//       }
//       cartList.add(
//         CartItem(selectProduct, quantity),
//       ); //cartList에 CartItem(selectProduct, quantity) 상품과 개수를 함께 저장
//       total +=
//           selectProduct.price * quantity; //total에 상품 한개의 가격 * 개수를 더해 total업데이트
//       print('장바구니에 담겼어요!');
//     } catch (e) {
//       //예외처리 숫자가 아닌 문자열을 입력하면 int.parse에서 오류 발생 -> 메세지 출력
//       print('입력값이 올바르지 않아요!');
//     }
//   }

//   // 장바구니의 담긴 리스트와 총액 출력
//   void showTotal() {
//     if (cartList.isEmpty) {
//       print('장바구니에 담긴 상품이 없습니다.');
//     } else {
//       List<String> productNames = [];
//       for (var item in cartList) {
//         productNames.add(item.product.productName);
//       }
//       String productListString = productNames.join(',');
//       print('장바구니에 $productListString가 담겨있네요. 총 $total원 입니다!');
//     }
//   }

//   void clearCart() {
//     if (cartList.isEmpty) {
//       print('이미 잘바구니가 비어있습니다.');
//     } else {
//       print('장바구니를 초기화합니다.');
//       cartList.clear(); //list 초기화
//       total = 0; //합계 초기화
//     }
//   }
// }

// //상품클래스
// class Product {
//   String productName = "";
//   int price = 0;

//   Product(this.productName, this.price);

//   @override
//   String toString() {
//     //오버라이딩해서 출력할때 String으로 출력되도록
//     return '$productName/$price원';
//   }
// }

// class CartItem {
//   Product product;
//   int quantity;

//   CartItem(this.product, this.quantity);
// }

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
