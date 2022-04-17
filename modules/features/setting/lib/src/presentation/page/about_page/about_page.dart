import 'package:flutter/material.dart';
import 'package:setting/src/presentation/page/about_page/widget/about_appbar_widget.dart';
import 'package:setting/src/presentation/page/about_page/widget/about_image_widget.dart';
import 'package:ui_core/ui_core.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AboutAppBarWidget(),
            const AboutImageWidget(),
            SizedBox(height: context.getGridDimen(3)),
            Text(
              'Answer all questions and complete your pokedex!!!',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colorPalette.grey90,
              ),
            ),
            SizedBox(height: context.getGridDimen(4)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.getGridDimen(3),
              ),
              child: Text(
                'This app is made for demonstration of usage of firebase remote config and dynamic control of app',
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorPalette.grey90,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.getGridDimen(3),
              ),
              child: Text(
                'All images and texts used are open source and used for learning purpose',
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorPalette.grey90,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: context.getGridDimen(3)),
          ],
        ),
      ),
    );
  }
}
