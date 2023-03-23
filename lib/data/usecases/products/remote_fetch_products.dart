import 'package:dio/dio.dart';

import '../../../domain/domain.dart';
import '../../data.dart';

class RemoteFetchProducts implements FetchProductsUsecase {

  @override
  Future<List<ProductEntity>> call() async {
    try {
      final result = await Dio().get('https://dummyjson.com/products');
      return (result.data['products'] as List)
        .map((e) => ProductModel.fromMap(map: e))
        .toList();
    } catch (error) {
      return [];
    }
  }
}
