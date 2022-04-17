import 'package:flutter/material.dart';
import 'package:ui_core/assets/assets.gen.dart';
import 'package:ui_core/ui_core.dart';

class AboutImageWidget extends StatelessWidget {
  const AboutImageWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: context.height * 0.1,
        width: context.width * 0.7,
        child: Image.asset(
          Assets.images.pokemonMaster.path,
          package: 'ui_core',
        ),
      ),
    );
  }
}
