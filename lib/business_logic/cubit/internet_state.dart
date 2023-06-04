part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  const InternetConnected({
    required this.connectionType,
  });

  final ConnectionType connectionType;
}

class InternetDisconnected extends InternetState {}
