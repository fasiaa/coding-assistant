import 'package:flutter/material.dart';

double scrWidth(c) => MediaQuery.of(c).size.width;
double scrHeight(c) => MediaQuery.of(c).size.height;

Widget kWidth(double w) => SizedBox(width: w);
Widget kHeight(double h) => SizedBox(height: h);

Widget kWidthHeight(w, h) => SizedBox(
  width: w,
  height: h,
);
