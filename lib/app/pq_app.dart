import 'package:flutter/material.dart';
import 'package:pokemon_quiz/app/pq_app_view_model.dart';
import 'package:ui_core/ui_core.dart';

class PQApp extends StatelessWidget {
  const PQApp({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ViewModelProviderWidget<PQAppViewModel>(
      onViewModelProvided: (viewModel) => viewModel.onInit(),
      builder: (context, viewModel, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: viewModel.appTheme.lightTheme,
          darkTheme: viewModel.appTheme.darkTheme,
          home: child,
        );
      },
    );
  }
}
