import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class MenuTileWidget extends StatelessWidget {
  const MenuTileWidget({
    required this.label,
    required this.leadingIcon,
    required this.onTap,
    this.trailingIcon,
    Key? key,
  }) : super(key: key);

  final String label;
  final IconData leadingIcon;
  final IconData? trailingIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        color: context.colorPalette.grey50,
      ),
      title: Text(
        label,
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colorPalette.grey50,
        ),
      ),
      trailing: trailingIcon != null
          ? Icon(
              trailingIcon,
              color: context.colorPalette.grey50,
            )
          : const SizedBox.shrink(),
    );
  }
}
