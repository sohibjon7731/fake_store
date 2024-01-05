import 'package:dio/dio.dart';
import 'package:fake_store/features/home/data/models/product.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> getProducts();

  factory HomeRemoteDataSource() => _HomeRemoteDataSourceImpl();
}

class _HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final dio = Dio(BaseOptions(baseUrl: 'https://fakestoreapi.com'));

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response = await dio.get('/products');
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return (response.data as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
      } else {
        throw 'Response failed!';
      }
    } catch (error) {
      throw 'Something went wrong!';
    }
  }
}
