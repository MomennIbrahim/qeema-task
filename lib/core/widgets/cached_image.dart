import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:qeema_tech/core/widgets/custom_loading.dart';

class CustomCachedNetWorkImage extends StatelessWidget {
  const CustomCachedNetWorkImage({
    super.key,
    required this.image,
    this.height,
    this.width,
  });

  final String image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.contain,
      height: height,
      width: width,
      placeholder: (context, url) => const SizedBox(
        width: 100,
        height: 100,
      ),
      errorWidget: (context, url, error) => const CustomLoading(),
    );
  }
}
