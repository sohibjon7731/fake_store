import 'package:fake_store/core/either/either.dart';
import 'package:fake_store/core/failure/failure.dart';

import 'package:fake_store/features/home/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
