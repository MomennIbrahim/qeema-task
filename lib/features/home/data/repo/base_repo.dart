import 'package:dartz/dartz.dart';
import 'package:qeema_tech/features/home/data/models/prodcut_details_model.dart';
import 'package:qeema_tech/features/home/data/models/product_model.dart';

import '../../../../core/error/error.dart';

abstract class BaseRepo {
  Future<Either<Failure, ProductModel>> getProducts();
  Future<Either<Failure, ProductDetailsModel>> getProductDetails(
      {required int productId});
}
