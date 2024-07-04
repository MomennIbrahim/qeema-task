import 'package:flutter/material.dart';

double sizedH(context, height) {
  return MediaQuery.sizeOf(context).height * height;
}

double sizedW(context, width) {
  return MediaQuery.sizeOf(context).width * width;
}
