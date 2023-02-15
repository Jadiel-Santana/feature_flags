import '../../domain/domain.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
    required super.count,
  });

  factory ProductModel.fromMap({required Map<String, dynamic> map}) {
    try {
      return ProductModel(
        id: map['id']?.toInt() ?? 0,
        title: map['title'] ?? '',
        price: map['price']?.toDouble() ?? 0.0,
        description: map['description'] ?? '',
        category: map['category'] ?? '',
        image: map['image'] ?? '',
        rating: map['rating']['rate']?.toDouble() ?? 0.0,
        count: map['rating']['count']?.toInt() ?? 0,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
