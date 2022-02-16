import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSize {
  static const designSize = Size(375, 667);
  
  static int height(value) {
    return ScreenUtil().setHeight(value.toDouble()).toDouble().ceil();
  }

  static int width(value) {
    return ScreenUtil().setWidth(value.toDouble()).toDouble().ceil();
  }

  static int sp(value) {
    return ScreenUtil().setSp(value.toDouble()).toDouble().ceil();
  }

  static double get statusBarHeight => ScreenUtil().statusBarHeight;

  static double get appBarContentHeight => 44;

  static double get appBarHeight => (statusBarHeight + appBarContentHeight);

  /// logical pixel width
  static double get screenWidthDP => ScreenUtil().screenWidth;

  /// logical pixel height
  static double get screenHeightDP => ScreenUtil().screenHeight;

  /// device bottom  safe margin
  static double get bottomSafeMargin => ScreenUtil().bottomBarHeight;

  static double get textScaleFactor => ScreenUtil().textScaleFactor;

  static instance() => ScreenUtil;
}
