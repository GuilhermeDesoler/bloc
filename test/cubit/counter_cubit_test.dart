import 'package:bloc_app/business_logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('The initial state of CounterCubit is CounterState(counterValue: 0)',
        () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });

    blocTest(
      'The cubit should emit a CounterState(counterValue: 1, wasIncremented: true) when cubit.increment() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, wasIncremented: true)],
    );

    blocTest(
      'The cubit should emit a CounterState(counterValue: -1, wasIncremented: false) when cubit.decrement() function is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, wasIncremented: false)],
    );
  });
}
