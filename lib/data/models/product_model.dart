import '../../domain/domain.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.brand,
    required super.category,
    required super.image,
    required super.rating,
    required super.stock,
  });

  factory ProductModel.fromMap({required Map<String, dynamic> map}) {
    try {
      return ProductModel(
        id: map['id']?.toInt() ?? 0,
        title: map['title'] ?? '',
        price: map['price']?.toDouble() ?? 0.0,
        brand: map['brand'] ?? '',
        category: map['category'] ?? '',
        image: map['thumbnail'] ?? '',
        rating: map['rating']?.toDouble() ?? 0.0,
        stock: map['stock']?.toInt() ?? 0,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
