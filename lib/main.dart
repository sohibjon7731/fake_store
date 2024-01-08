import 'package:fake_store/features/home/data/data_source/remote_data_source.dart';
import 'package:fake_store/features/home/data/repository/product.dart';
import 'package:fake_store/features/home/domain/repository/product.dart';
import 'package:fake_store/features/home/domain/usecase/get_products.dart';
import 'package:fake_store/features/home/presentation/blocs/product_bloc.dart';
import 'package:fake_store/features/home/presentation/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const FakeStoreApp());
}

class FakeStoreApp extends StatelessWidget {
  const FakeStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => ProductBloc(GetProductUseCase(ProductRepositoryImpl(HomeRemoteDataSource()))),
      child: const MaterialApp(
        home: App(),
      ),
    );
  }
}
