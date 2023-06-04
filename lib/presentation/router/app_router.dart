import 'package:bloc_app/business_logic/cubit/counter_cubit.dart';
import 'package:bloc_app/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  final _counterCubit = CounterCubit();

  Route? onGeneratedRoute(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
                title: 'Home Screen', color: Colors.blueAccent),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
                title: 'Second Screen', color: Colors.redAccent),
          ),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterCubit,
            child: const HomeScreen(
                title: 'Third Screen', color: Colors.greenAccent),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
