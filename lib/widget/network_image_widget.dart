import 'package:flutter/material.dart';

import 'base_network_image_widget.dart';

class NetworkRImage extends BaseNetworkRImage {
  NetworkRImage({
    Key? key,
    required String imageURL,
    double? width,
    double? height,
    Widget? errorWidget,
    bool placeHolderHidden = false,
    BoxFit fit = BoxFit.cover,
    Duration fadeInDuration = const Duration(milliseconds: 250),
    double allBorderRadius = 0,
    Widget? placeHolder,
  }) : super(
          key: key,
          imageURL: imageURL,
          width: width,
          height: height,
          errorWidget: errorWidget,
          placeHolderHidden: placeHolderHidden,
          fit: fit,
          fadeInDuration: fadeInDuration,
          allBorderRadius: allBorderRadius,
          placeHolder: placeHolder ??
              Image.asset(
                "assets/images/bg_placeholder.png",
                width: width,
                height: height,
                fit: fit,
              ),
        );
}
