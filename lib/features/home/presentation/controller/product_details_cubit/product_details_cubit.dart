import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:qeema_tech/features/home/data/models/prodcut_details_model.dart';
import 'package:qeema_tech/features/home/data/repo/base_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(this.baseRepo) : super(ProductDetailsInitial());

  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  final BaseRepo baseRepo;

  ProductDetailsModel? productDetailsModel;

  void getProductDetails({required int productId}) async {
    emit(GetProductDetailsLoadingState());

    var result = await baseRepo.getProductDetails(productId: productId);
    result.fold((l) {
      log("----------Error is:${l.errMessage}-----------");
      emit(GetProductDetailsFailureState(l.errMessage));
    }, (r) {
      productDetailsModel = r;
      emit(GetProductDetailsSuccessState(r));
    });
  }

  int activeIndex = 0;

  void changeActiveIndex({required int index}) {
    activeIndex = index;
    emit(ChangeActiveIndexState());
  }
}
