part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class GetProductLoadingState extends ProductState {}

final class GetProductSuccessState extends ProductState {
  final ProductModel productModel;

  GetProductSuccessState(this.productModel);
}

final class GetProductFailureState extends ProductState {
  final String errMessage;

  GetProductFailureState(this.errMessage);
}
