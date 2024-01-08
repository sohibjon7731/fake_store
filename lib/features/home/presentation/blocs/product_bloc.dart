import 'package:fake_store/core/usecase/usecase.dart';
import 'package:fake_store/features/home/data/data_source/remote_data_source.dart';
import 'package:fake_store/features/home/data/repository/product.dart';

import 'package:fake_store/features/home/domain/usecase/get_products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../domain/entities/product.dart';

part 'product_state.dart';
part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductUseCase getProductsUseCase;

  ProductBloc(this.getProductsUseCase)
      : super(ProductState(products: [], status: LoadingStatus.pure)) {
    on<ProductBlocStarted>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      final usecase =
          await GetProductUseCase(ProductRepositoryImpl(HomeRemoteDataSource()))
              .call(NoParams());

      usecase.either(
        (failure) {
          emit(state.copyWith(status: LoadingStatus.loadingWithFailure));
        },
        (products) {
          emit(state.copyWith(status: LoadingStatus.loadingWithSuccsess, products: products));
        },
      );
    });
  }
}
