import 'package:flutter/material.dart';
import 'package:setting/src/presentation/page/developer_page/developer_view_model.dart';
import 'package:setting/src/presentation/page/developer_page/widget/feature_toggle_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class DeveloperPage extends StatelessWidget {
  const DeveloperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconTheme.of(context).copyWith(
          color: context.colorPalette.grey80,
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          'Developer Option',
          style: context.textTheme.headlineMedium?.copyWith(
            color: context.colorPalette.grey90,
          ),
        ),
      ),
      body: ViewModelProviderWidget<DeveloperViewModel>(
          onViewModelProvided: (viewModel) => viewModel.onInit(),
          builder: (context, viewModel, widget) {
            return ViewStateBuilderWidget(
              viewState: viewModel.viewState,
              loadingBuilder: _buildLoadingState,
              errorBuilder: _buildErrorState,
              builder: _buildFeatureToggleList,
            );
          }),
    );
  }

  Widget _buildFeatureToggleList(BuildContext context) {
    final viewModel = context.watch<DeveloperViewModel>();
    final featureConfigs = viewModel.featureConfigs;
    return ListView.separated(
        padding: EdgeInsets.symmetric(vertical: context.getGridDimen(2)),
        separatorBuilder: (_, __) {
          return SizedBox(height: context.getGridDimen(3));
        },
        itemCount: featureConfigs.length,
        itemBuilder: (context, index) {
          final featureConfig = featureConfigs[index];
          return FeatureToggleWidget(
            title: viewModel.getFeatureTitle(featureConfig.feature),
            description: viewModel.getFeatureDescription(featureConfig.feature),
            isEnabled: featureConfig.isEnabled,
            onToggle: (flag) => viewModel.toggleFeature(
              flag,
              featureConfig.feature,
            ),
          );
        });
  }

  Widget _buildLoadingState(BuildContext context) {
    return AnimatedLoadingWidget(
      height: context.shortestSide * 0.5,
      width: context.shortestSide * 0.5,
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return const ErrorPageWidget();
  }
}
