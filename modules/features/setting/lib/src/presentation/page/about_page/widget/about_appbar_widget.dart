import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class AboutAppBarWidget extends StatelessWidget {
  const AboutAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.getGridDimen(2)),
      child: Row(children: const [CloseIconButtonWidget(iconSizeFactor: 4)]),
    );
  }
}
