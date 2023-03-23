import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String brand;
  final String category;
  final String image;
  final double rating;
  final int stock;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.brand,
    required this.category,
    required this.image,
    required this.rating,
    required this.stock,
  });

  @override
  List<Object> get props => [
        id,
        title,
        price,
        brand,
        category,
        image,
        rating,
        stock,
      ];
}
