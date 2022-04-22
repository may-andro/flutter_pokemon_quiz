import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class TestWidgetWrapper extends StatelessWidget {
  const TestWidgetWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en', 'EN'),
      builder: (context, child) => AppThemeProviderWidget(child: child!),
      home: Scaffold(
        body: child,
      ),
    );
  }
}
