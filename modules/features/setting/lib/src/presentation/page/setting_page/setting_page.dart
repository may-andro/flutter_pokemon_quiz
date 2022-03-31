import 'package:flutter/material.dart';
import 'package:setting/src/presentation/page/setting_page/setting_view_model.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProviderWidget<SettingViewModel>(
        onViewModelProvided: (viewModel) => viewModel.onInit(),
        builder: (context, viewModel, _) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              title: Text(
                'Setting',
                style: context.textTheme.displaySmall?.copyWith(
                  color: context.colorPalette.grey90,
                ),
              ),
            ),
            body: ListView(
              children: [
                SizedBox(height: context.getGridDimen(3)),
                _buildSettingTitle(context, 'General'),
                SizedBox(height: context.getGridDimen(0.1)),
                _buildGeneralSettings(context),
                SizedBox(height: context.getGridDimen(5)),
                _buildSettingTitle(context, 'Developer'),
                SizedBox(height: context.getGridDimen(0.1)),
                _buildDeveloperSettings(context),
                SizedBox(height: context.getGridDimen(3)),
              ],
            ),
          );
        });
  }

  Widget _buildSettingTitle(BuildContext context, String label) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getGridDimen(2)),
      child: Text(
        label,
        style: context.textTheme.titleMedium,
      ),
    );
  }

  Widget _buildGeneralSettings(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    return Column(
      children: [
        _buildListItem(
          context,
          'About',
          Icons.info,
          () => Navigator.pushNamed(context, SettingRoute.about),
        ),
        viewModel.isFeedbackFeatureEnabled
            ? _buildListItem(
                context,
                'Feedback',
                Icons.feedback,
                () => Navigator.pushNamed(context, SettingRoute.feedback),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildDeveloperSettings(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    return Column(
      children: [
        _buildListItem(
          context,
          'Github',
          Icons.code,
          () {},
        ),
        viewModel.isDeveloperModeEnabled
            ? _buildListItem(
                context,
                'Developer Option',
                Icons.developer_mode_rounded,
                () =>
                    Navigator.pushNamed(context, SettingRoute.developerOption),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  Widget _buildListItem(
    BuildContext context,
    String label,
    IconData leadingIcon,
    VoidCallback onTap,
  ) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        leadingIcon,
        color: context.colorPalette.grey90,
      ),
      title: Text(
        label,
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colorPalette.grey90,
        ),
      ),
      trailing: Icon(
        Icons.navigate_next,
        color: context.colorPalette.grey90,
      ),
    );
  }
}
