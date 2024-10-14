class ProductEntity {
  final String name;
  final String image;
  final double price;
  final String amount;
  final String category;
  final bool isLike;

  ProductEntity({
    required this.name,
    required this.image,
    required this.price,
    required this.amount,
    required this.category,
    this.isLike = false,
  });
}
