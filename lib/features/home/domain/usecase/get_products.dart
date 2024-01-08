import 'package:fake_store/core/either/either.dart';
import 'package:fake_store/core/failure/failure.dart';
import 'package:fake_store/core/usecase/usecase.dart';
import 'package:fake_store/features/home/domain/entities/product.dart';
import 'package:fake_store/features/home/domain/repository/product.dart';

class GetProductUseCase implements UseCase<List<ProductEntity>, NoParams> {
  final ProductRepository _productRepository;
  const GetProductUseCase(ProductRepository repository)
      : _productRepository = repository;

  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParams params) {
    return _productRepository.getProducts();
  }
}
