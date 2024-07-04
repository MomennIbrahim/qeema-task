import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qeema_tech/features/home/data/models/prodcut_details_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utlis/styles.dart';
import '../../../../../core/widgets/cached_image.dart';
import '../../../../../core/widgets/custom_size.dart';
import '../../controller/product_details_cubit/product_details_cubit.dart';
import 'carousel_widget.dart';
import 'discount_widget.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key, required this.productDetailsModel});

  final ProductDetailsModel productDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap(
          sizedH(context, 0.09),
        ),
        Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: sizedW(context, 0.06)),
              child: CustomCarouselSlider(
                items: productDetailsModel.data!.images!
                    .map((e) => CustomCachedNetWorkImage(
                          image: e,
                        ))
                    .toList(),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 28,
                )),
            if (productDetailsModel.data!.discount != 0)
              Positioned(
                right: sizedW(context, 0.05),
                top: sizedH(context, 0.014),
                child: DiscountWidget(
                  discount: productDetailsModel.data!.discount!,
                ),
              )
          ],
        ),
        Gap(sizedH(context, 0.01)),
        Center(
            child: AnimatedSmoothIndicator(
          activeIndex: ProductDetailsCubit.get(context).activeIndex,
          count: productDetailsModel.data!.images!.length,
          effect:
              const JumpingDotEffect(radius: 8, dotHeight: 12, dotWidth: 15),
        )),
        Gap(
          sizedH(context, 0.07),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100]!,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 4,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: sizedW(context, 0.04),
                vertical: sizedH(context, 0.035),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      productDetailsModel.data?.name ?? "",
                      style: Styles.textStyle20,
                    ),
                    Gap(
                      sizedH(context, 0.01),
                    ),
                    Text("\$${productDetailsModel.data?.oldPrice ?? " "}",
                        style: productDetailsModel.data!.discount == 0
                            ? Styles.textStyle22
                            : const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red)),
                    if (productDetailsModel.data!.discount != 0)
                      Text("\$${productDetailsModel.data?.price ?? " "}",
                          style: Styles.textStyle22),
                    Gap(
                      sizedH(context, 0.02),
                    ),
                    Text(
                      productDetailsModel.data?.description ?? "",
                      style: Styles.textStyle15,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
