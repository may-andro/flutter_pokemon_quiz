import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class SettingTitleTextWidget extends StatelessWidget {
  const SettingTitleTextWidget({
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.getGridDimen(2)),
          child: Text(
            label,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorPalette.grey90,
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: context.colorPalette.grey30,
        )
      ],
    );
  }
}
