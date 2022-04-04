import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconTheme.of(context).copyWith(
          color: context.colorPalette.grey80,
        ),
        automaticallyImplyLeading: true,
        title: Text(
          'About',
          style: context.textTheme.headlineMedium?.copyWith(
            color: context.colorPalette.grey90,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.getGridDimen(3)),
        child: Column(
          children: [
            Text(
              'Become the Pokemon Master!!',
              style: context.textTheme.headline5?.copyWith(
                color: context.colorPalette.grey70,
              ),
            ),
            Text(
              'Answer all questions and unlock your pokedex!!!',
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colorPalette.grey90,
              ),
            ),
            SizedBox(height: context.getGridDimen(4)),
            Text(
              'This app is made for demonstration of usage of firebase remote congif and dynamic control of app',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colorPalette.grey90,
              ),
            ),
            SizedBox(height: context.getGridDimen(4)),
            Text(
              'All images and texts used are open source and used for learning purpose',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorPalette.grey90,
              ),
            )
          ],
        ),
      ),
    );
  }
}
