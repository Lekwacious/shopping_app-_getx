class CartItem {
  final String id;
  final String productTitle;
  final int productQuantity;
  final double productPrice;

  CartItem(
      {required this.id,
        required this.productTitle,
        required this.productQuantity,
        required this.productPrice});
}