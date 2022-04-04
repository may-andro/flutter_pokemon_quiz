import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconTheme.of(context).copyWith(
          color: context.colorPalette.grey80,
        ),
        automaticallyImplyLeading: true,
        title: Text(
          'Feedback',
          style: context.textTheme.headlineMedium?.copyWith(
            color: context.colorPalette.grey90,
          ),
        ),
      ),
      body: Container(),
    );
  }
}
