import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qeema_tech/features/home/presentation/controller/product_details_cubit/product_details_cubit.dart';

class CustomCarouselSlider extends StatelessWidget {
  CustomCarouselSlider({super.key, required this.items});

  final List<Widget> items;
  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        return CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            height: 150.0,
            aspectRatio: 16 / 9,
            viewportFraction: .75,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              ProductDetailsCubit.get(context).changeActiveIndex(index: index);
            },
          ),
          items: items,
        );
      },
    );
  }
}
