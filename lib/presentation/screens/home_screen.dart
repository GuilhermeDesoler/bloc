import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../business_logic/cubit/counter_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.title,
    required this.color,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            const SizedBox(height: 24),
            MaterialButton(
              color: color,
              onPressed: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: const Text('Go to Second Screen'),
            ),
            const SizedBox(height: 24),
            MaterialButton(
              color: color,
              onPressed: () {
                Navigator.of(context).pushNamed('/third');
              },
              child: const Text('Go to Third Screen'),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: 'btn 1',
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).decrement();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 8),
          FloatingActionButton(
            heroTag: 'btn 2',
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
