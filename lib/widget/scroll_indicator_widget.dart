import 'package:flutter/material.dart';

class ScrollIndicator extends StatefulWidget {
  // 指示器位置
  final double progress;

  final double numberOfPages;

  final double radius;

  final Color containerColor;

  final Color tintColor;

  final double itemWidth;

  final double itemHeight;

  ScrollIndicator({
    double? progress,
    this.numberOfPages = 1.0,
    Color? containerColor,
    Color? tintColor,
    this.radius = 3.0,
    this.itemWidth = 20.0,
    this.itemHeight = 6.0,
  })  : progress = progress ?? 0,
        containerColor = containerColor ?? Colors.black.withOpacity(0.1),
        tintColor = tintColor ?? Colors.white;

  @override
  _ScrollIndicatorState createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator> {
  double progress = 0;

  @override
  void didUpdateWidget(ScrollIndicator oldWidget) {
    if (oldWidget.progress == widget.progress) {
      progress = 0;
    } else {
      progress = widget.progress;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: widget.itemHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: widget.containerColor,
          ),
          width: widget.numberOfPages * widget.itemWidth,
        ),
        Positioned(
          height: widget.itemHeight,
          left: progress * widget.itemWidth,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.radius),
              color: widget.tintColor,
            ),
            width: widget.itemWidth,
          ),
        ),
      ],
    );
  }
}
