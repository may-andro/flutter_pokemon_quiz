import 'package:flutter/material.dart';
import 'package:ui_core/src/component/device_resolution/device_resolution.dart';
import 'package:ui_core/src/extension/context_extension.dart';

class ResponsiveContainerWidget extends StatelessWidget {
  const ResponsiveContainerWidget({
    required this.mobileBuilder,
    required this.tabletBuilder,
    required this.desktopBuilder,
    Key? key,
  }) : super(key: key);

  final WidgetBuilder mobileBuilder;
  final WidgetBuilder tabletBuilder;
  final WidgetBuilder desktopBuilder;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) {
          switch (context.deviceResolution) {
            case DeviceResolution.mobile:
              return mobileBuilder(context);
            case DeviceResolution.tablet:
              return tabletBuilder(context);
            case DeviceResolution.desktop:
              return desktopBuilder(context);
            default:
              return mobileBuilder(context);
          }
        },
      ),
    );
  }
}
