import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.freezed.dart';

part 'product.g.dart';

@Freezed()
class ProductModel with _$ProductModel {
  const factory ProductModel({
    @Default(0) int id,
    @Default('') String title,
    @Default(0) double prize,
    @Default('') String description,
    @Default('') String category,
    @Default('') String image,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'rating') ProductRatingModel? productRatingModel,
  }) = _ProductModel;
  /* @JsonKey(defaultValue: 0)
  final int id;
  @JsonKey(defaultValue: '')
  final String title;
  @JsonKey(defaultValue: 0)
  final double price;
  @JsonKey(defaultValue: '')
  final String description;
  @JsonKey(defaultValue: '')
  final String category;
  @JsonKey(defaultValue: '')
  final String image;
  @JsonKey(name: 'rating')
  final ProductRatingModel? productRatingModel;
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    this.productRatingModel,
  }):super(image: image, title: title, rate: productRatingModel?.rate??0); */
  factory ProductModel.fromJson(Map<String, dynamic> data) =>
      _$ProductModelFromJson(data);
  /* Map<String, dynamic> toJson() => _$ProductModelToJson(this); */
}

@JsonSerializable()
class ProductRatingModel {
  @JsonKey(defaultValue: 0)
  final double rate;
  @JsonKey(defaultValue: 0)
  final int count;
  ProductRatingModel({
    required this.rate,
    required this.count,
  });

  factory ProductRatingModel.fromJson(Map<String, dynamic> data) =>
      _$ProductRatingModelFromJson(data);
  Map<String, dynamic> toJson() => _$ProductRatingModelToJson(this);
}
