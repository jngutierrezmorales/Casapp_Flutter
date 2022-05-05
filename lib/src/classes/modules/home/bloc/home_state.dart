part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {}

class HomeInProgress extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeFailure extends HomeState {
  final String error;

  const HomeFailure({required this.error});
}
