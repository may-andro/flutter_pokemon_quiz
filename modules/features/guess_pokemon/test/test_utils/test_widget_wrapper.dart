import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:ui_core/ui_core.dart';

class TestWidgetWrapper extends StatelessWidget {
  const TestWidgetWrapper({
    Key? key,
    required this.child,
    this.navigatorObserver,
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
    final args = routeSettings.arguments;
    final routesMap = <String, MaterialPageRoute>{
      '/': MaterialPageRoute(
        builder: (_) {
          return Scaffold(
            body: child,
          );
        },
      ),
      PokemonDetailRoute.root: MaterialPageRoute(
        builder: (_) {
          if (args is Pokemon) {
            return Scaffold(
              body: Container(
                key: const Key('pokemon_detail_page'),
                child: Text(args.name),
              ),
            );
          }
          return const ErrorPageWidget();
        },
      ),
    };
    return routesMap[routeSettings.name];
  }
}
