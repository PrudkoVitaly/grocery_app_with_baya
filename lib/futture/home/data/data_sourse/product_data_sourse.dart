import 'package:grocery_app_with_baya/futture/home/data/model/product_model.dart';

// Класс  отвечает за локальное хранение данных
// Реализовали логику получения данных
abstract class ProductDataSource {
  Future<List<ProductModel>> getProductFromDB();
}

class ProductLocalDataSource implements ProductDataSource {
  @override
  Future<List<ProductModel>> getProductFromDB() async {
    return [
      ProductModel(
        image: "image",
        price: 8,
        name: "Fresh Peach",
        amount: "dozen",
        category: "Vegetables",
      ),
      ProductModel(
        image: "image",
        price: 7,
        name: "Avocado",
        amount: "2",
        category: "Fruits",
      ),
      ProductModel(
        image: "image",
        price: 9.90,
        name: "Pineapple",
        amount: "1.50",
        category: "Fruits",
      ),
      ProductModel(
        image: "image",
        price: 3.00,
        name: "Fresh Broccoli",
        amount: "1",
        category: "Vegetables",
      ),
    ];
  }
}
