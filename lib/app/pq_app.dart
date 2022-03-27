import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PQApp extends StatelessWidget {
  const PQApp({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: child,
      builder: (_, child) {
        return AppThemeProviderWidget(child: child!);
      },
    );
  }
}
