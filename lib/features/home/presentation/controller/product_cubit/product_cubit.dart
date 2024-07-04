import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qeema_tech/features/home/data/models/product_model.dart';
import 'package:qeema_tech/features/home/data/repo/base_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.baseRepo) : super(ProductInitial());

  final BaseRepo baseRepo;
  static ProductCubit get(context) => BlocProvider.of(context);

  getProducts() async {
    emit(GetProductLoadingState());

    var result = await baseRepo.getProducts();
    result.fold((l) {
      log("---------Error is :${l.errMessage}---------");
      emit(GetProductFailureState(l.errMessage));
    }, (r) {
      emit(GetProductSuccessState(r));
    });
  }
    Future<void> refresh() {
    return Future.delayed(const Duration(seconds: 4));
  }
}
