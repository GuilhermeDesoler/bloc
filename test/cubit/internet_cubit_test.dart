import 'package:bloc_app/business_logic/cubit/internet_cubit.dart';
import 'package:bloc_app/constants/enums.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('InternetCubit', () {
    late InternetCubit internetcubit;
    WidgetsFlutterBinding.ensureInitialized();

    setUp(() {
      internetcubit = InternetCubit(connectivity: Connectivity());
    });

    tearDown(() {
      internetcubit.close();
    });

    test('The initial state of InternetCubit is InternetLoading()', () {
      expect(internetcubit.state, InternetLoading());
    });

    blocTest(
      'On wifi connection the cubit should emit a InternetConnected(connectionType: ConnectionType.wifi)',
      build: () => internetcubit,
      act: (cubit) => cubit.emitInternetConnected(ConnectionType.wifi),
      expect: () =>
          [const InternetConnected(connectionType: ConnectionType.wifi)],
    );

    blocTest(
      'On mobile connection the cubit should emit a InternetConnected(connectionType: ConnectionType.mobile)',
      build: () => internetcubit,
      act: (cubit) => cubit.emitInternetConnected(ConnectionType.mobile),
      expect: () =>
          [const InternetConnected(connectionType: ConnectionType.mobile)],
    );

    blocTest(
      'On no internet connection the cubit should emit a InternetDisconnected()',
      build: () => internetcubit,
      act: (cubit) => cubit.emitInternetDisconnected(),
      expect: () => [InternetDisconnected()],
    );
  });
}
