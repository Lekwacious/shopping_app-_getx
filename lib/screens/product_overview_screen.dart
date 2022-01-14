import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx/controllers/cart_controller.dart';
import 'package:shopping_getx/screens/cart_screen.dart';
import 'package:shopping_getx/widgets/app_drawer.dart';
import 'package:shopping_getx/widgets/badge.dart';
import 'package:shopping_getx/widgets/product_grid.dart';

class ProductOverviewPage extends StatelessWidget {
  const ProductOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Shop"),
        actions: <Widget>[
          GetBuilder<CartController>(
              init: CartController(),
              builder: (value) {
                return Badge(
                  child: IconButton(
                      icon: const Icon(
                        Icons.shopping_cart,
                      ),
                      onPressed: () {
                        Get.to(() => const CartScreen());
                      }),
                  value: cartController.itemCount.toString(),
                  color: Theme.of(context).colorScheme.secondary,
                );
              })
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductsGrid(),
    );
  }
}