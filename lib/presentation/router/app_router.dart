import 'package:bloc_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(title: 'Home Screen', color: Colors.blueAccent),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) =>
              const HomeScreen(title: 'Second Screen', color: Colors.redAccent),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(
              title: 'Third Screen', color: Colors.greenAccent),
        );
      default:
        return null;
    }
  }
}
