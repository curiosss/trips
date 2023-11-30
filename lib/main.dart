import 'package:flutter/material.dart';
import 'package:trips/core/config/theme/app_themes.dart';
import 'package:trips/core/routes/router.dart';
import 'package:trips/injection_container.dart';

void main() {
  setupDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      routerConfig: goRouter,
    );
  }
}
