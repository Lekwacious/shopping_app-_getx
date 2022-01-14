//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_getx/controllers/cart_controller.dart';
import 'package:shopping_getx/controllers/product_controller.dart';

class ProductDetailsScreen extends StatelessWidget {

  final String title;
  final double price;
  final String image;
  final String description;

  const ProductDetailsScreen(this.title, this.price, this.image, this.description, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffF6F6F6),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Chip(
                      label: Text(
                        "Price: \$" + price.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "" + description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xff403B58),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}