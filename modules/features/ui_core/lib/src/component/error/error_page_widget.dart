import 'package:flutter/material.dart';
import 'package:ui_core/src/extension/extension.dart';
import 'package:ui_core/src/component/error/error_icon_widget.dart';
import 'package:ui_core/src/component/button/button.dart';

class ErrorPageWidget extends StatelessWidget {
  const ErrorPageWidget({
    this.errorLabel,
    this.error,
    this.onRetry,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onRetry;
  final String? error;
  final String? errorLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          errorLabel ?? 'Ooops...',
          style: context.textTheme.titleLarge?.copyWith(
            color: context.colorPalette.grey70,
          ),
        ),
        SizedBox(height: context.getGridDimen(4)),
        ErrorIconWidget(
          height: context.shortestSide * 0.3,
          width: context.shortestSide * 0.3,
        ),
        SizedBox(height: context.getGridDimen(4)),
        Text(
          error ?? 'Something went wrong!',
          style: context.textTheme.labelMedium?.copyWith(
            color: context.colorPalette.grey70,
          ),
        ),
        SizedBox(height: context.getGridDimen(4)),
        if (onRetry != null) ...[
          PrimaryButton(label: 'Retry', onPressed: onRetry)
        ]
      ],
    );
  }
}
