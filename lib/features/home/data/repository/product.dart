import 'package:fake_store/core/either/either.dart';
import 'package:fake_store/core/exception/exception.dart';
import 'package:fake_store/core/extensions/model.dart';
import 'package:fake_store/core/failure/failure.dart';
import 'package:fake_store/features/home/data/data_source/remote_data_source.dart';

import 'package:fake_store/features/home/domain/entities/product.dart';
import 'package:fake_store/features/home/domain/repository/product.dart';


class ProductRepositoryImpl implements ProductRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;

  const ProductRepositoryImpl(HomeRemoteDataSource homeRemoteDataSource)
      : _homeRemoteDataSource = homeRemoteDataSource;

  @override
  Future<Either<ServerFailure, List<ProductEntity>>> getProducts() async {
    try {
      final response = await _homeRemoteDataSource.getProducts();
      return Right(response.map((model) => model.toEntity).toList());
    } on ServerExseption catch (exception) {
      return Left(ServerFailure.fromServerExseption(exception));
    }
  }
}
