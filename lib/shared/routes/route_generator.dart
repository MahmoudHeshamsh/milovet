import 'package:flutter/material.dart';
import 'package:milovet/auth/view/screens/login_screen.dart';
import 'package:milovet/auth/view/screens/register_screen.dart';
import 'package:milovet/get_started/view/screens/get_started.dart';
import 'package:milovet/shared/routes/routes.dart';
import 'package:milovet/get_started/view/screens/onboarding_screen_one.dart';
import 'package:milovet/get_started/view/screens/onboarding_screen_two.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onboardingOne:
        return MaterialPageRoute(builder: (_) => const OnboardingScreenOne());
      case Routes.onboardingTwo:
        return MaterialPageRoute(builder: (_) => const OnboardingScreenTwo());
      case Routes.getStarted:
        return MaterialPageRoute(builder: (_) => const GetStarted());
        case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
        case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      default:
        return _undefinedRoute();
    }
  }

  static Route<dynamic> _undefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}
