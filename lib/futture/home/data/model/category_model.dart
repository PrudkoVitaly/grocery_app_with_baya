class CategoryModel {
  final String name;
  final String image;
  final String category;
  final double weight;
  final double price;
  final bool isFavorite;
  final double discount;

  CategoryModel({
    required this.name,
    required this.image,
    required this.category,
    required this.weight,
    required this.price,
    required this.isFavorite,
    required this.discount,
  });
}
