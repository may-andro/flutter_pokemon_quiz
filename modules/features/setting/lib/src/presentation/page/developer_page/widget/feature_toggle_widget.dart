import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class FeatureToggleWidget extends StatelessWidget {
  const FeatureToggleWidget({
    required this.title,
    required this.description,
    required this.isEnabled,
    required this.onToggle,
    Key? key,
  }) : super(key: key);

  final String title;
  final String description;
  final bool isEnabled;
  final Function(bool) onToggle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: context.getGridDimen(2)),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(context.getGridDimen(2)),
        child: Column(
          children: [
            _buildTitle(context, title),
            SizedBox(height: context.getGridDimen(1)),
            Divider(
              height: 1,
              color: context.colorPalette.grey30,
            ),
            SizedBox(height: context.getGridDimen(1)),
            Text(
              description,
              style: context.textTheme.labelSmall?.copyWith(
                color: context.colorPalette.grey90,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: context.textTheme.titleSmall?.copyWith(
            color: context.colorPalette.grey90,
          ),
        ),
        Switch(value: isEnabled, onChanged: onToggle)
      ],
    );
  }
}
