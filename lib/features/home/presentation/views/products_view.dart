import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qeema_tech/core/utlis/service_locator.dart';
import 'package:qeema_tech/core/utlis/styles.dart';
import 'package:qeema_tech/core/widgets/custom_size.dart';
import 'package:qeema_tech/core/widgets/products_loading.dart';
import 'package:qeema_tech/features/home/presentation/controller/product_cubit/product_cubit.dart';
import 'package:qeema_tech/features/home/presentation/views/widgets/product_item.dart';

import '../../../../core/widgets/err_widget.dart';
import '../../data/repo/repo_impl.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(getIt.get<RepoImpl>())..getProducts(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Products",
            style: Styles.textStyle25,
          ),
        ),
        body: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is GetProductSuccessState) {
              return RefreshIndicator(
                onRefresh: () {
                  return ProductCubit.get(context).getProducts();
                },
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding:
                      EdgeInsets.symmetric(horizontal: sizedW(context, 0.035)),
                  itemBuilder: (context, index) => ProductItem(
                    productModel: state.productModel.data!.data![index],
                  ),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: sizedH(context, 0.02)),
                  itemCount: state.productModel.data!.data!.length,
                ),
              );
            } else if (state is GetProductFailureState) {
              return ErrWidget(
                message: state.errMessage,
                onRetry: () {
                  ProductCubit.get(context).getProducts();
                },
              );
            } else {
              return const ProductsLoading();
            }
          },
        ),
      ),
    );
  }
}
