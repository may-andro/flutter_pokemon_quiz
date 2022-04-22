import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class TestWidgetWrapper extends StatelessWidget {
  const TestWidgetWrapper({
    required this.child,
    this.navigatorObserver,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final NavigatorObserver? navigatorObserver;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en', 'EN'),
      builder: (context, child) => AppThemeProviderWidget(child: child!),
      navigatorObservers: navigatorObserver != null ? [navigatorObserver!] : [],
      onGenerateRoute: _generateRoute,
      initialRoute: '/',
    );
  }

  Route<dynamic>? _generateRoute(RouteSettings routeSettings) {
    final routesMap = <String, MaterialPageRoute>{
      '/': MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            body: child,
          );
        },
      ),
      PokedexRoute.root: MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            body: Container(
              key: const Key('pokedex_page'),
              child: const Text('Pokedex'),
            ),
          );
        },
      ),
    };
    return routesMap[routeSettings.name];
  }
}
