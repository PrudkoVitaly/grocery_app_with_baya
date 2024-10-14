import 'package:grocery_app_with_baya/futture/home/domein/entities/product_entity.dart';

// Описали контракт для получения продуктов (какие данные мы можем получить и как мы можем с ними работать)
abstract class ProductRepositories {
  Future<List<ProductEntity>> getProducts();
}
