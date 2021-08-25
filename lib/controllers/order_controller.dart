import 'package:get/get.dart';
import 'package:shopping_app/models/cart_item.dart';
import 'package:shopping_app/models/order.dart';

class OrderController extends GetxController {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        Order(
            id: DateTime.now().toString(),
            products: cartProducts,
            amount: total,
            dateTime: DateTime.now()));
    update();
  }
}
