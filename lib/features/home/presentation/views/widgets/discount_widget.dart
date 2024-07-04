import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_size.dart';

class DiscountWidget extends StatelessWidget {
  const DiscountWidget({super.key, required this.discount});

  final dynamic discount;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sizedW(context, 0.17),
      height: sizedH(context, 0.027),
      color: Colors.red,
      child: Center(
        child: Text(
          "%$discount OFF",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
