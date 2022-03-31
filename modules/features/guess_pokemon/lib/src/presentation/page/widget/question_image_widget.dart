import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';
import 'package:cached_network_image/cached_network_image.dart';

class QuestionImageWidget extends StatelessWidget {
  const QuestionImageWidget({
    required this.url,
    required this.isVisible,
    Key? key,
  }) : super(key: key);

  final String url;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    final color = isVisible
        ? Colors.transparent
        : context.isDarkMode
            ? Colors.black87
            : Colors.black;
    final blendMode = isVisible ? BlendMode.saturation : BlendMode.modulate;

    return ColorFiltered(
      colorFilter: ColorFilter.mode(color, blendMode),
      child: Hero(
        tag: url,
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.contain,
          progressIndicatorBuilder: (context, url, downloadProgress) {
            return Center(
              child: AnimatorLoadingWidget(
                height: context.width * 0.2,
                width: context.width * 0.2,
              ),
            );
          },
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            size: context.getGridDimen(4),
          ),
        ),
      ),
    );
  }
}
