import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BaseNetworkRImage extends StatefulWidget {
  final Key? key;
  final String imageURL;
  final Widget placeHolder;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final bool placeHolderHidden;
  final BoxFit fit;
  final Duration fadeInDuration;
  final double allBorderRadius;

  BaseNetworkRImage({
    this.key,
    required this.imageURL,
    this.width,
    this.height,
    this.errorWidget,
    this.placeHolderHidden = false,
    this.fit = BoxFit.cover,
    this.fadeInDuration = const Duration(milliseconds: 250),
    this.allBorderRadius = 0,
    Widget? placeHolder,
  }) : placeHolder = placeHolder ??
            Image.asset(
              "assets/images/bg_placeholder.png",
              width: width,
              height: height,
              fit: fit,
              package: "ealing_widget",
            );

  @override
  _BaseNetworkRImageState createState() => _BaseNetworkRImageState();
}

class _BaseNetworkRImageState extends State<BaseNetworkRImage> {
  String? reloadImageKey;

  @override
  Widget build(BuildContext context) {
    if (widget.imageURL != "") {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.allBorderRadius),
        child: CachedNetworkImage(
          key: widget.key ?? (ValueKey(reloadImageKey ?? widget.imageURL)),
          imageUrl: widget.imageURL,
          placeholder: widget.placeHolderHidden
              ? null
              : (context, url) => widget.placeHolder,
          errorWidget: (context, url, error) {
            reloadImageKey =
                widget.imageURL + '?v=${DateTime.now().millisecondsSinceEpoch}';
            return widget.errorWidget ?? widget.placeHolder;
          },
          fadeInDuration: widget.fadeInDuration,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(widget.allBorderRadius),
        child: widget.errorWidget ?? widget.placeHolder,
      );
    }
  }
}
