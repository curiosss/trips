import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:trips/core/config/styles/dimens.dart';
import 'package:trips/core/routes/app_routes.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  goToTerms() {
    try {
      Uri? uri = Uri.tryParse('https://flutter.dev/');
      if (uri != null) {
        launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(Dimens.largeMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
                context.go(AppRoutes.tripsSearchPage);
              },
              child: const Text(
                'Get Started',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimens.midMargin),
              child: ElevatedButton(
                onPressed: goToTerms,
                child: const Text(
                  'Terms and Conditions, Privacy Policy',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
