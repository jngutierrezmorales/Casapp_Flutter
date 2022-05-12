part of 'splash_bloc.dart';

@immutable
abstract class SplashState {
  const SplashState();
}

class SplashInitialState extends SplashState {}

class SplashInProgressState extends SplashState {}

class SplashUserCheckState extends SplashState {
  UserModel user;
  SplashUserCheckState(this.user);
}

class SplashFailureState extends SplashState {
  final String error;

  const SplashFailureState({required this.error});
}