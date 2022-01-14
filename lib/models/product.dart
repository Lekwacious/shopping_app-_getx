class Product{
  final int   id;
  final String productTitle;
  final String imageUrl;
  final String description;
  final double price;
  bool isFavourite;

  Product(
      {required this.id,
        required this.productTitle,
        required this.imageUrl,
        required this.description,
        required this.price,
        this.isFavourite = false});

}