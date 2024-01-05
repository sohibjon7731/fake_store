import 'package:fake_store/core/either/either.dart';
import 'package:fake_store/core/exception/exception.dart';
import 'package:fake_store/core/failure/failure.dart';
import 'package:fake_store/features/home/data/data_source/remote_data_source.dart';

import 'package:fake_store/features/home/domain/entities/product.dart';
import 'package:fake_store/features/home/domain/repository/product.dart';

class ProductRepositoryImpl extends ProductRepository {
  HomeRemoteDataSource _homeRemoteDataSource = HomeRemoteDataSource();

  @override
  Future<Either<ServerFailure, List<ProductEntity>>> getProducts() async {
    try {
      final response = await _homeRemoteDataSource.getProducts();
      return Right(response);
    } on ServerExseption catch (exception) {
      return Left(ServerFailure.fromServerExseption(exception));
    }
  }
}
