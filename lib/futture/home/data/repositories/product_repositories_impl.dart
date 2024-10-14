import 'package:grocery_app_with_baya/futture/home/data/data_sourse/product_data_sourse.dart';

import '../../domein/entities/product_entity.dart';
import '../../domein/repositories/product_repositories.dart';

// Класс  отвечает за логику работы с продуктами
class ProductRepositoriesImpl implements ProductRepositories {
  final ProductDataSource _productDataSource;
  ProductRepositoriesImpl(this._productDataSource);

  @override
  Future<List<ProductEntity>> getProducts() async {
    return await _productDataSource.getProductFromDB();
  }
}
