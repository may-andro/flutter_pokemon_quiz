import 'package:flutter/material.dart';
import 'package:setting/src/presentation/page/setting_page/setting_view_model.dart';
import 'package:setting/src/presentation/page/setting_page/widget/menu_tile_widget.dart';
import 'package:setting/src/presentation/page/setting_page/widget/setting_title_text_widget.dart';
import 'package:ui_core/ui_core.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconTheme.of(context).copyWith(
          color: context.colorPalette.grey80,
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Setting',
          style: context.textTheme.headlineMedium?.copyWith(
            color: context.colorPalette.grey90,
          ),
        ),
      ),
      body: ViewModelProviderWidget<SettingViewModel>(
          onViewModelProvided: (viewModel) => viewModel.onInit(),
          builder: (context, viewModel, _) {
            return ListView(
              children: [
                SizedBox(height: context.getGridDimen(3)),
                const SettingTitleTextWidget(label: 'General'),
                SizedBox(height: context.getGridDimen(0.1)),
                _buildGeneralSettings(context),
                SizedBox(height: context.getGridDimen(5)),
                const SettingTitleTextWidget(label: 'Developer'),
                SizedBox(height: context.getGridDimen(0.1)),
                _buildDeveloperSettings(context),
                SizedBox(height: context.getGridDimen(3)),
              ],
            );
          }),
    );
  }

  Widget _buildGeneralSettings(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    return Column(
      children: [
        MenuTileWidget(
          label: 'About',
          trailingIcon: Icons.navigate_next,
          leadingIcon: Icons.info,
          onTap: () => Navigator.pushNamed(context, SettingRoute.about),
        ),
        MenuTileWidget(
          label: 'Privacy Policy',
          trailingIcon: Icons.open_in_browser,
          leadingIcon: Icons.privacy_tip,
          onTap: () => launch(viewModel.privacyPolicy),
        ),
        MenuTileWidget(
          label: 'Terms & Conditions',
          leadingIcon: Icons.insert_link,
          trailingIcon: Icons.open_in_browser,
          onTap: () => launch(viewModel.termsAndConditions),
        ),
        if (viewModel.isFeedbackFeatureEnabled) ...[
          MenuTileWidget(
            label: 'Feedback',
            leadingIcon: Icons.feedback,
            onTap: () => Navigator.pushNamed(context, SettingRoute.feedback),
          )
        ]
      ],
    );
  }

  Widget _buildDeveloperSettings(BuildContext context) {
    final viewModel = context.watch<SettingViewModel>();
    return Column(
      children: [
        MenuTileWidget(
          label: 'Github',
          leadingIcon: Icons.code,
          trailingIcon: Icons.open_in_browser,
          onTap: () =>
              launch('https://github.com/may-andro/flutter_pokemon_quiz'),
        ),
        if (viewModel.isDeveloperModeEnabled) ...[
          MenuTileWidget(
            label: 'Developer Option',
            leadingIcon: Icons.developer_mode_rounded,
            trailingIcon: Icons.navigate_next,
            onTap: () =>
                Navigator.pushNamed(context, SettingRoute.developerOption),
          )
        ]
      ],
    );
  }
}
