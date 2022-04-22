import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class PokedexErrorWidget extends StatelessWidget {
  const PokedexErrorWidget({
    required this.error,
    Key? key,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ErrorPageWidget(
        errorLabel: error,
      ),
    );
  }
}
