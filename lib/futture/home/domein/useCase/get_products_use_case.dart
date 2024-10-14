import 'package:grocery_app_with_baya/futture/home/domein/entities/product_entity.dart';
import '../../data/repositories/product_repositories_impl.dart';

// Класс  отвечает за логику работы с продуктами
// Класс, который будет вызывать репозиторий, чтобы получить данные, и предоставлять их слою представления (например, в UI).
class GetProductsUseCase {
  final ProductRepositoriesImpl _productRepositoriesImpl;

  GetProductsUseCase(this._productRepositoriesImpl);

  Future<List<ProductEntity>> call() async {
    return await _productRepositoriesImpl.getProducts();
  }
}
