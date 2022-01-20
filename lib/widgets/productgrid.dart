import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/product_controller.dart';
import 'package:shopping_app/screens/product_details_screen.dart';

// ignore: must_be_immutable
class ProductsGrid extends StatelessWidget {
  bool showFavourites;

  ProductsGrid(
    this.showFavourites,
  );
  final controller = Get.put(ProductController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {


    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: controller.itemsAll(showFavourites).length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) {
        return GetBuilder(
          init: ProductController(),
          builder: (value) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    ProductDetailsScreen(
                      controller.itemsAll(showFavourites)[index].title,
                      controller.itemsAll(showFavourites)[index].price,
                      controller.itemsAll(showFavourites)[index].imageUrl,
                      controller.itemsAll(showFavourites)[index].description,
                    ),
                  );
                },
                child: Image.network(
                  controller.itemsAll(showFavourites)[index].imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.amber,
                      alignment: Alignment.center,
                      child: const Text(
                        'No Image!',
                        style: TextStyle(fontSize: 30),
                      ),
                    );
                  }
                ),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black87,
                leading: IconButton(
                  icon: Icon(
                    controller.itemsAll(showFavourites)[index].isFavourite == true
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: Theme.of(context).accentColor,
                  ),
                  onPressed: () {
                    controller.toggleFavouriteStatus(index);
                  },
                ),
                title: Text(
                  controller.itemsAll(showFavourites)[index].title,
                  textAlign: TextAlign.center,
                ),
                trailing: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (cont) {
                      return IconButton(
                        icon: Icon(Icons.shopping_cart),
                        onPressed: () {
                          cartController.addItem(
                              controller.itemsAll(showFavourites)[index].id,
                              controller.itemsAll(showFavourites)[index].price,
                              controller.itemsAll(showFavourites)[index].title,
                              1);
                        },
                        color: Theme.of(context).accentColor,
                      );
                    }),
              ),
            ),
          ),
        );
      },
    );
  }
}
