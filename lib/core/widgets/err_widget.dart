import 'package:flutter/material.dart';
import 'package:qeema_tech/core/utlis/styles.dart';

class ErrWidget extends StatelessWidget {
  const ErrWidget({super.key, required this.message, this.onRetry});

  final String message;
  final Function()? onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: Styles.textStyle20,
          ),
          MaterialButton(
              color: const Color(0xFFEA3799),
              onPressed: () {
                onRetry!();
              },
              child: const Text(
                "Retry",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
