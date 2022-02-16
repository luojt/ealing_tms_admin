import 'dart:async';
import 'package:ealing_tms_admin/utils/object_util.dart';
import 'package:flutter/material.dart';

class BannerView<T> extends StatefulWidget {
  /// 数据源
  final List<T> data;

  /// 间隔秒数，默认 5 秒
  final int interval;

  /// 高度，默认 200
  final double height;

  /// 是否自动滚动，默认 true
  final bool autoScroll;

  /// 构造器, 根据 data 构建 Widght
  final Widget Function(int index, T data) itemBuilder;

  /// banner 点击回调
  final void Function(int index, T data)? onPressed;

  /// 滚动 回调
  final void Function(double progress)? onScrolled;

  /// 停止滚动选中 回调
  final void Function(int index)? onScrollEnd;

  BannerView({
    Key? key,
    required this.data,
    required this.itemBuilder,
    this.onPressed,
    this.onScrolled,
    this.onScrollEnd,
    this.interval = 5,
    this.height = 200,
    this.autoScroll = true,
  }) : super(key: key);

  @override
  _BannerViewState createState() => _BannerViewState();
}

class _BannerViewState extends State<BannerView> {
  late PageController _pageController;

  Timer? _timer;

  int _itemCount = 0;

  double _widgetW = 0;

  ScrollPhysics _physics = const PageScrollPhysics();

  int get controllerPage => _pageController.page?.round() ?? 0;

  @override
  void initState() {
    super.initState();
    _widgetW = 0.0;
    _itemCount = widget.data.length * 1000 * 1000;
    _pageController = PageController(initialPage: _itemCount ~/ 2);
    _physics = widget.data.length <= 1
        ? NeverScrollableScrollPhysics()
        : PageScrollPhysics();
    _resetTimer();
  }

  @override
  void didUpdateWidget(covariant BannerView oldWidget) {
    if (oldWidget != widget) {
      _physics = widget.data.length <= 1
          ? NeverScrollableScrollPhysics()
          : PageScrollPhysics();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    if (ObjectUtil.isNotEmpty(widget.data)) {
      return NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: LayoutBuilder(
          builder: (context, constraints) {
            _widgetW = constraints.maxWidth;
            return Container(
              color: Colors.transparent,
              height: widget.height,
              width: double.infinity,
              child: widget.data.length <= 0
                  ? null
                  : GestureDetector(
                      onTap: () {
                        int index = controllerPage.round() % widget.data.length;
                        widget.onPressed?.call(index, widget.data[index]);
                      },
                      onTapDown: (detail) {
                        _clearTimer();
                      },
                      onTapUp: (detail) {
                        _resetTimer();
                      },
                      onTapCancel: () {
                        _resetTimer();
                      },
                      child: PageView.builder(
                        controller: _pageController,
                        physics: _physics,
                        itemBuilder: (context, index) {
                          return widget.itemBuilder(
                              index, widget.data[index % widget.data.length]);
                        },
                        itemCount: _itemCount,
                      ),
                    ),
            );
          },
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification is ScrollUpdateNotification) {
      double progress =
          (notification.metrics.pixels / _widgetW) % widget.data.length;
      if (progress > (widget.data.length - 1)) {
        progress = 0;
      }
      widget.onScrolled?.call(progress);
    } else if (notification is ScrollEndNotification) {
      final offsetIndex = (notification.metrics.pixels / _widgetW).round();
      int index = (offsetIndex % widget.data.length).toInt();
      widget.onScrollEnd?.call(index);
    }
    return true;
  }

  void _resetTimer() {
    if (!widget.autoScroll || widget.data.length <= 1) {
      return;
    }
    _clearTimer();
    _timer = Timer.periodic(
      Duration(seconds: 5),
      (timer) {
        // ignore: invalid_use_of_protected_member
        if (_pageController.positions.isNotEmpty) {
          int nextPage = (controllerPage + 1);
          _pageController.animateToPage(nextPage,
              duration: const Duration(milliseconds: 250),
              curve: Curves.linear);
        }
      },
    );
  }

  void _clearTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
  }

  @override
  void dispose() {
    _clearTimer();
    _pageController.dispose();
    super.dispose();
  }
}
