import 'package:grocery_app_with_baya/futture/home/data/model/category_model.dart';

import '../../domein/repositories/get_product_by_categories.dart';
import '../data_sourse/category_data_source.dart';

class ProductRepositoriesImpl implements GetProductByCategories {
  final List<CategoryModel> _categories = [
    CategoryModel(
      name: "Fruits",
      image: "assets/fruits.png",
      category: "fruits",
      weight: 1.0,
      price: 1.0,
      isFavorite: false,
      discount: 0.0,
    ),
    CategoryModel(
      name: "Vegetables",
      image: "assets/vegetables.png",
      category: "vegetables",
      weight: 1.0,
      price: 1.0,
      isFavorite: false,
      discount: 0.0,
    ),
    CategoryModel(
      name: "Dairy",
      image: "assets/dairy.png",
      category: "dairy",
      weight: 1.0,
      price: 1.0,
      isFavorite: false,
      discount: 0.0,
    ),
    CategoryModel(
      name: "Meat",
      image: "assets/meat.png",
      category: "meat",
      weight: 1.0,
      price: 1.0,
      isFavorite: false,
      discount: 0.0,
    ),
  ];

  Future<List<CategoryModel>> getProductByCategories(
      String category) async {
    return _categories
        .where((product) => product.category == category)
        .toList();
  }
}
