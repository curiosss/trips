import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trips/core/config/theme/app_themes.dart';
import 'package:trips/core/routes/router.dart';
import 'package:trips/features/trips/presentaion/bloc/trip_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TripsBloc>(create: (context) => TripsBloc()),
      ],
      child: MaterialApp.router(
        theme: lightTheme,
        routerConfig: goRouter,
      ),
    );
  }
}
