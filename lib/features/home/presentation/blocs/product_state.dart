// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

enum LoadingStatus { pure, loading, loadingWithSuccsess, loadingWithFailure }

class ProductState {
  final List<ProductEntity> products;
  final LoadingStatus status;

  ProductState({required this.products, required this.status});
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductState &&
          runtimeType == other.runtimeType &&
          products == other.products;

  @override
  int get hashCode => products.hashCode;

  ProductState copyWith({
    List<ProductEntity>? products,
    LoadingStatus? status,
  }) {
    return ProductState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'ProductState(products: $products, status: $status)';
}


