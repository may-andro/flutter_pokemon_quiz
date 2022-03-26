import 'package:flutter/material.dart';
import 'package:ui_core/src/presentation/component/error/full_page_error_widget.dart';
import 'package:ui_core/src/presentation/component/view_state/view.dart';

class ViewStateBuilderWidget extends StatelessWidget {
  const ViewStateBuilderWidget({
    Key? key,
    required this.viewState,
    required this.loadingBuilder,
    required this.builder,
    this.onRetry,
    this.errorBuilder,
  }) : super(key: key);

  final ViewState viewState;
  final WidgetBuilder loadingBuilder;
  final WidgetBuilder builder;
  final VoidCallback? onRetry;
  final WidgetBuilder? errorBuilder;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    switch (viewState) {
      case ViewState.error:
        final errorBuilder = this.errorBuilder;
        if (errorBuilder != null) {
          return errorBuilder(context);
        }
        return const FullPageErrorWidget();
      case ViewState.success:
        return builder(context);
      case ViewState.loading:
        return loadingBuilder(context);
    }
  }
}
