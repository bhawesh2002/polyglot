import 'package:flutter/material.dart';

extension DeviceMetrics on BuildContext {
  double get deviceWt => MediaQuery.of(this).size.width;
  double get deviceHt => MediaQuery.of(this).size.height;
  double get dpr => MediaQuery.of(this).devicePixelRatio;
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;
  double get viewPaddingTop => MediaQuery.viewPaddingOf(this).top;
  double get viewPaddingBottom => MediaQuery.viewPaddingOf(this).bottom;
  double get viewinsetsBottom => MediaQuery.viewInsetsOf(this).bottom;

  bool get isDarkMode =>
      MediaQuery.of(this).platformBrightness == Brightness.dark;
  EdgeInsets get devicePadding =>
      EdgeInsets.only(top: viewPaddingBottom, bottom: viewPaddingTop);
  EdgeInsets get devicePaddingTop => EdgeInsets.only(top: viewPaddingTop);
  EdgeInsets get devicePaddingBottom =>
      EdgeInsets.only(bottom: viewPaddingBottom);
}
