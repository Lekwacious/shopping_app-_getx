import 'dart:core';

import 'package:get/get.dart';
import 'package:shopping_app/models/cart_item.dart';

class CartController extends GetxController {
   Map<int, CartItem> _items = {};

  Map<int, CartItem> get items {
    return {..._items};
  }

  int get itemCount{
      // return  _items?.length?? 0;
  return _items.length;

  }
  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addItem(int productId, double price, String title, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: existingCartItem.price));
      update();

    } else {
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
    }
    update();
  }
  void removeitem(int productId){
    _items.remove(productId);
    update();
  }

  void clear(){
    _items = {};
    update();
  }
}
