import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx/screens/order_screen.dart';
import 'package:shopping_getx/screens/product_overview_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text("Hello Friend"),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text("Shop"),
            onTap: (){
              Get.to(()=>const ProductOverviewPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text("Orders"),
            onTap: (){
              Get.to(()=>OrderScreen());
            },
          ),
        ],
      ),

    );
  }
}