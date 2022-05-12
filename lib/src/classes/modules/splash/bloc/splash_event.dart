part of 'splash_bloc.dart';

class SplashEvent {
  const SplashEvent();
}

class SplashCheckUserEvent extends SplashEvent {
  final BuildContext context;

  SplashCheckUserEvent({
    required this.context,
  });
}

class SplashNavigateToLoginEvent extends SplashEvent {
  final BuildContext context;

  SplashNavigateToLoginEvent({
    required this.context,
  });
}

class SplashNavigateToHomeEvent extends SplashEvent {
  final BuildContext context;
  SplashNavigateToHomeEvent({
    required this.context,
  });
}
