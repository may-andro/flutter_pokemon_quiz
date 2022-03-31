import 'package:flutter/material.dart';
import 'package:ui_core/src/extension/context.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Error Page',
          style: context.textTheme.displaySmall?.copyWith(
            color: context.colorPalette.grey90,
          ),
        ),
      ),
      body: const Center(
        child: Text('Broken Link'),
      ),
    );
  }
}
