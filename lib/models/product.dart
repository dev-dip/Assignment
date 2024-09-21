class Product {
  final String productId;
  final String productName;
  final String productCode;
  final String productImage;
  final String unitPrice;
  final String quantity;
  final String totalPrice;
  final String createAt;

  Product(
      {required this.productId,
        required this.productName,
        required this.productCode,
        required this.productImage,
        required this.unitPrice,
        required this.quantity,
        required this.totalPrice,
        required this.createAt});
}