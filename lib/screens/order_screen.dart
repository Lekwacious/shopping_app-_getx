import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx/controllers/order_controller.dart';
import 'package:shopping_getx/widgets/app_drawer.dart';
import 'package:shopping_getx/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);

  final orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yours Orders"),
      ),
      drawer: const AppDrawer(),
      body: Obx(() => ListView.builder(
          itemCount: orderController.orders.length,
          itemBuilder: (context, index) =>
              OrderItem(orderController.orders[index])),
      ),
    );
  }
}