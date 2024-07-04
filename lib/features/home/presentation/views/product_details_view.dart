import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qeema_tech/core/utlis/service_locator.dart';
import 'package:qeema_tech/core/utlis/styles.dart';
import 'package:qeema_tech/core/widgets/custom_loading.dart';
import 'package:qeema_tech/core/widgets/err_widget.dart';
import 'package:qeema_tech/features/home/data/repo/repo_impl.dart';
import 'package:qeema_tech/features/home/presentation/controller/product_details_cubit/product_details_cubit.dart';
import 'package:qeema_tech/features/home/presentation/views/widgets/product_details_body.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ProductDetailsCubit(getIt.get<RepoImpl>())
          ..getProductDetails(productId: productId),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
            builder: (context, state) {
              return ConditionalBuilder(
                condition: state is! GetProductDetailsLoadingState &&
                    ProductDetailsCubit.get(context).productDetailsModel !=
                        null,
                builder: (context) {
                  if (state is GetProductDetailsSuccessState) {
                    if (state.productDetailsModel.status == true) {
                      return ProductDetailsBody(
                        productDetailsModel: ProductDetailsCubit.get(context)
                            .productDetailsModel!,
                      );
                    } else {
                      Center(
                          child: Text(
                        ProductDetailsCubit.get(context)
                                .productDetailsModel
                                ?.message ??
                            " ",
                        style: Styles.textStyle25,
                      ));
                    }
                  }
                  return ProductDetailsBody(
                    productDetailsModel:
                        ProductDetailsCubit.get(context).productDetailsModel!,
                  );
                },
                fallback: (context) => state is GetProductDetailsFailureState
                    ? ErrWidget(
                        message: state.errMessage,
                        onRetry: () {
                          ProductDetailsCubit.get(context)
                              .getProductDetails(productId: productId);
                        },
                      )
                    : const CustomLoading(),
              );
            },
          ),
        ));
  }
}
