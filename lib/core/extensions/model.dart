import 'package:fake_store/features/home/data/models/product.dart';
import 'package:fake_store/features/home/domain/entities/product.dart';

extension ProductModelExtension on ProductModel {
  ProductEntity get toEntity {
    return ProductEntity(
      image: image,
      title: title,
      id: id,
      prize: prize,
      description: description,
      category: category,
    );
  }
}
