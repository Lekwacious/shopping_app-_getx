import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx/controllers/cart_controller.dart';

class CartItem extends StatelessWidget {
  final String id;
  final int productId;
  final double price;
  final int quantity;
  final String title;

  const CartItem(this.id, this.price, this.quantity, this.title, this.productId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartController = Get.put(CartController());
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: const Icon(Icons.delete, color: Colors.white,size: 40,

        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin:  const EdgeInsets.symmetric(horizontal: 15, vertical: 4),

      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction){
        cartController.removeItem(productId);

      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Chip(
              label: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('\$$price'),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ),
            title: Text(title),
            subtitle: Text('Total: \$${(price * quantity)}'),
            trailing: Text('$quantity X'),
          ),
        ),
      ),
    );
  }
}