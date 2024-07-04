import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utlis/styles.dart';
import 'custom_size.dart';

class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "No internet connection",
              style: Styles.textStyle16,
            ),
            Gap(sizedW(context, 0.02)),
            const Icon(Icons.wifi_off),
          ],
        ),
      ),
    );
  }
}
