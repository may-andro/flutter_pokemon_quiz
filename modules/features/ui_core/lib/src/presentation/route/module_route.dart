import 'package:flutter/material.dart';

abstract class ModuleRoute {
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings);
}
