import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

extension SizeExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenShortestSide => MediaQuery.of(this).size.shortestSide;
  double get screenlongestSide => MediaQuery.of(this).size.longestSide;

  double get adjustedHeight => kToolbarHeight - MediaQuery.of(this).padding.top;

  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;

  bool get isMobile => ResponsiveWrapper.of(this).isMobile;
  bool get isTablet => ResponsiveWrapper.of(this).isTablet;
  bool get isDesktop => ResponsiveWrapper.of(this).isDesktop;

  // double formWidth() {
  //   if (ResponsiveBreakpoints.of(this).isMobile) {
  //     return MediaQuery.of(this).size.width;
  //   } else {
  //     return MediaQuery.of(this).size.width > 900
  //         ? 900
  //         : MediaQuery.of(this).size.width;
  //   }
  // }
}
