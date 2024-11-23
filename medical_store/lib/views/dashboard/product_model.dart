class Product {
  final String id;
  final String name;
  final double price;
  final double discountedPrice;
  final String description;
  final String imageAsset;
  final String brandName;
  final String ingredients;
  final String expiryDate;
  final String productDetails;
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.discountedPrice,
    required this.description,
    required this.imageAsset,
    required this.brandName,
    required this.ingredients,
    required this.expiryDate,
    required this.productDetails,
    this.quantity = 1,
  });
}
