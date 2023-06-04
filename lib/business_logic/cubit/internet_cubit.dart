import 'dart:async';

import 'package:bloc_app/constants/enums.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    connectivityStream =
        connectivity.onConnectivityChanged.listen(_monitorInternetConnection);
  }

  final Connectivity connectivity;
  late StreamSubscription connectivityStream;

  void _monitorInternetConnection(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.wifi) {
      emitInternetConnected(ConnectionType.wifi);
      return;
    }

    if (connectivityResult == ConnectivityResult.mobile) {
      emitInternetConnected(ConnectionType.mobile);
      return;
    }

    emitInternetDisconnected();
  }

  void emitInternetConnected(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  @override
  Future<void> close() {
    connectivityStream.cancel();
    return super.close();
  }
}
