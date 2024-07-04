part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class GetProductDetailsLoadingState extends ProductDetailsState {}

final class GetProductDetailsSuccessState extends ProductDetailsState {
  final ProductDetailsModel productDetailsModel;

  GetProductDetailsSuccessState(this.productDetailsModel);
}

final class GetProductDetailsFailureState extends ProductDetailsState {
  final String errMessage;

  GetProductDetailsFailureState(this.errMessage);
}

final class ChangeActiveIndexState extends ProductDetailsState {}
