import 'package:flutter/material.dart';

enum EdgeInsetsButtonStyle {
  Top, //图片在上，文字在下
  Left, //图片在左，文字在右
  Bottom, //图片在下，文字在上
  Right //图片在右，文字在左
}

class EdgeInsetsButton extends StatelessWidget {
  final Text text;
  final Widget image;
  final double space; //间距
  final EdgeInsetsButtonStyle style;
  final VoidCallback? onPressed; //点击事件
  final bool isExpanded; // text 是否填充剩余的空间，反之整体尺寸自适应， 默认为 true
  final double? height;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  EdgeInsetsButton(
      {required this.text,
      required this.image,
      this.onPressed,
      this.space = 4,
      this.isExpanded = true,
      this.style = EdgeInsetsButtonStyle.Top,
      this.height,
      this.padding,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    Widget widget;
    switch (style) {
      case EdgeInsetsButtonStyle.Left:
        widget = Row(
          children: [
            image,
            SizedBox(width: space),
            isExpanded ? Expanded(child: text) : text,
          ],
        );
        break;
      case EdgeInsetsButtonStyle.Bottom:
        widget = Column(
          children: [
            isExpanded ? Expanded(child: text) : text,
            SizedBox(height: space),
            image,
          ],
        );
        break;
      case EdgeInsetsButtonStyle.Right:
        widget = Row(
          children: [
            isExpanded ? Expanded(child: text) : text,
            SizedBox(width: space),
            image,
          ],
        );
        break;
      default:
        widget = Column(
          children: [
            image,
            SizedBox(height: space),
            isExpanded ? Expanded(child: text) : text,
          ],
        );
    }

    return InkWell(
      onTap: this.onPressed,
      child: Container(
        alignment: this.alignment,
        height: this.height,
        padding: this.padding,
        child: widget,
      ),
    );
  }
}
