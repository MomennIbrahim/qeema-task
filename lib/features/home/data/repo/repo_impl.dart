import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:qeema_tech/core/error/error.dart';
import 'package:qeema_tech/core/utlis/api_service.dart';
import 'package:qeema_tech/features/home/data/models/prodcut_details_model.dart';
import 'package:qeema_tech/features/home/data/models/product_model.dart';
import 'package:qeema_tech/features/home/data/repo/base_repo.dart';

import '../../../../core/utlis/end_points.dart';

class RepoImpl implements BaseRepo {
  final ApiService apiService;

  RepoImpl(this.apiService);

  @override
  Future<Either<Failure, ProductModel>> getProducts() async {
    try {
      var response = await apiService.getData(
        endPoint: EndPoints.getProducts,
      );
      return right(ProductModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(
      {required int productId}) async {
    log("--------product details---------");
    try {
      var response = await apiService.getData(
        endPoint: "${EndPoints.getProductDetails}$productId",
      );
      return right(ProductDetailsModel.fromJson(response));
    } catch (e) {
      if (e is DioException) {
        log(e.response.toString());
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
