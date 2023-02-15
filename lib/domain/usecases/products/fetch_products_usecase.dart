import '../../entities/entities.dart';

abstract class FetchProductsUsecase {
  Future<List<ProductEntity>> call();
}
