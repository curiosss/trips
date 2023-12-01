import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trips/config/theme/app_themes.dart';
import 'package:trips/common/routes/router.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:trips/features/trips/bloc/trip_bloc.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: lightTheme,
      routerConfig: goRouter,
      locale: const Locale('ru', 'Ru'),
      scrollBehavior: const ScrollBehaviorModified(),
    );
  }
}

class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
