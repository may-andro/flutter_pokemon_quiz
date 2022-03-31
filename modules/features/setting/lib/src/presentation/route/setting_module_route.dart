import 'package:flutter/material.dart';
import 'package:setting/src/presentation/page/about_page/about_page.dart';
import 'package:setting/src/presentation/page/developer_page/developer_page.dart';
import 'package:setting/src/presentation/page/feedback_page/feedback_page.dart';
import 'package:setting/src/presentation/page/setting_page/setting_page.dart';
import 'package:ui_core/ui_core.dart';

class SettingModuleRoute extends ModuleRoute {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return <String, MaterialPageRoute>{
      SettingRoute.root: MaterialPageRoute(
        builder: (_) => const SettingPage(),
        settings: settings,
      ),
      SettingRoute.developerOption: MaterialPageRoute(
        builder: (_) => const DeveloperPage(),
        settings: settings,
      ),
      SettingRoute.about: MaterialPageRoute(
        builder: (_) => const AboutPage(),
        settings: settings,
      ),
      SettingRoute.feedback: MaterialPageRoute(
        builder: (_) => const FeedbackPage(),
        settings: settings,
      ),
    };
  }
}
