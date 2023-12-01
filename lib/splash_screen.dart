// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trips/common/routes/app_routes.dart';
import 'package:trips/injection_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    initDependencies();
    super.initState();
  }

  initDependencies() async {
    // await some dependencies to init
    await setupDependencies();
    await Future.delayed(const Duration(seconds: 1));
    GoRouter.of(context).go(AppRoutes.loginPage);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}
