import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/src/component/loading/loading.dart';
import 'package:ui_core/src/extension/extension.dart';
import 'package:ui_core/src/component/error/error_icon_widget.dart';

class ColorFilteredImageWidget extends StatelessWidget {
  const ColorFilteredImageWidget({
    required this.imageUrl,
    this.filterColor = Colors.transparent,
    this.blendMode = BlendMode.saturation,
    this.boxFit = BoxFit.cover,
    this.sizeFactor = 0.2,
    Key? key,
  }) : super(key: key);

  final Color filterColor;
  final BlendMode blendMode;
  final String imageUrl;
  final BoxFit boxFit;
  final double sizeFactor;

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(filterColor, blendMode),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: boxFit,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return Center(
            child: AnimatedLoadingWidget(
              height: context.shortestSide * sizeFactor,
              width: context.shortestSide * sizeFactor,
            ),
          );
        },
        errorWidget: (context, url, error) => FittedBox(
          child: Center(
            child: ErrorIconWidget(
              height: context.shortestSide * sizeFactor,
              width: context.shortestSide * sizeFactor,
            ),
          ),
        ),
      ),
    );
  }
}
