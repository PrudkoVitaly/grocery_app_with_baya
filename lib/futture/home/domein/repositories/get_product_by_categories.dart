import '../../data/model/category_model.dart';

abstract class GetProductByCategories {
  Future<List<CategoryModel>> getProductByCategories(String category);
}
