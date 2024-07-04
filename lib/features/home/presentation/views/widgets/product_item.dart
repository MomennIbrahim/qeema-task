import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:qeema_tech/core/widgets/custom_size.dart';
import 'package:qeema_tech/features/home/data/models/product_model.dart';
import 'package:qeema_tech/features/home/presentation/views/product_details_view.dart';
import 'package:qeema_tech/features/home/presentation/views/widgets/discount_widget.dart';

import '../../../../../core/utlis/styles.dart';
import '../../../../../core/widgets/cached_image.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.productModel});

  final DataModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailsView(
                      productId: productModel.id!,
                    )));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white12,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  topLeft: Radius.circular(15)),
              child: Stack(
                children: [
                  CustomCachedNetWorkImage(
                    image: productModel.image!,
                    width: sizedW(context, 0.27),
                    height: sizedH(context, 0.13),
                  ),
                  if (productModel.discount != 0)
                    DiscountWidget(
                      discount: productModel.discount,
                    ),
                ],
              ),
            ),
            Gap(
              sizedW(context, 0.025),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name ?? " ",
                    style: Styles.textStyle16,
                  ),
                  if (productModel.discount == 0) Gap(sizedH(context, 0.015)),
                  Text(
                    "\$${productModel.oldPrice ?? " "}",
                    style: productModel.discount == 0
                        ? Styles.textStyle18
                        : const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.red),
                  ),
                  if (productModel.discount != 0)
                    Text(
                      "\$${productModel.price ?? " "}",
                      style: Styles.textStyle18,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
