import 'dart:math';
import 'package:ealing_tms_admin/model/tms_content_item.dart';
import 'package:ealing_tms_admin/utils/size_util.dart';
import 'package:flutter/material.dart';

class HomeCategoryProvider with ChangeNotifier {
  /// 分类列表
  List<TMSContentItem> categoryList = <TMSContentItem>[];

  /// 样式
  final TextStyle textStyle = const TextStyle(
    color: Color(0xFF333333),
    height:  1.1,
    fontSize: 12,
  );

  /// section 一页数量
  final int sectionPageNum = 4;

  /// 图片与内容之间的间距
  final double itemContentSpace = 8;

  /// section 边距
  double sectionMargin = 0;

  /// item 的宽度
  double itemWidth = 0;

  /// item 中 image 的宽度
  double itemImageWidth = 0;

  /// 容器高度
  double sectionHeight = 0;

  /// item 之间的间距
  double itemSpace = 0;

  /// item 最高的高度
  double itemMaxTextHeight = 0;

  /// 滚动范围
  double progress = 0.0;

  Key? categoryKey;

  bool _disposed = false;

  bool get hasData => categoryList.isNotEmpty;

  bool get isHiddenIndicator =>
      hasData ? categoryList.length <= sectionPageNum : true;
  HomeCategoryProvider(this.categoryList){
    /// config section data
    if (hasData) {
      progress = 0;
      computeSectionData();
    }
    categoryKey = hasData ? ObjectKey(categoryList.first) : null;
  }


  void computeSectionData() {
    /// section 边距
    sectionMargin = AppSize.width(8).toDouble();

    /// item 的宽度
    itemWidth = AppSize.width(80).toDouble();

    /// item 中 image 的宽度
    itemImageWidth = AppSize.width(52).toDouble();

    for (var model in categoryList) {
      double height = max(14, getTextHeight(model));
      if (height > itemMaxTextHeight) {
        itemMaxTextHeight = height;
      }
    }
    sectionHeight = (itemImageWidth + itemMaxTextHeight + itemContentSpace)
        .ceil()
        .toDouble();
    itemSpace = (AppSize.screenWidthDP -
            (sectionMargin * 2) -
            (itemWidth * sectionPageNum)) /
        (sectionPageNum - 1);
    notifyListeners();
  }

  void handleScroll(double progress) {
    if (_disposed) {
      return;
    }
    this.progress = progress;
    notifyListeners();
  }

  double getTextHeight(TMSContentItem itemModel) {
    return (TextPainter(
            text: TextSpan(text: itemModel.name, style: textStyle),
            maxLines: 2,
            textScaleFactor: AppSize.textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout(maxWidth: itemWidth))
        .size
        .height;
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
