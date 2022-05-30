part of 'home_bloc.dart';

class HomeEvent {
  const HomeEvent();
}

class HomeGetHomesEvent extends HomeEvent {}

class HomeNavigateToFavoritesEvent extends HomeEvent {
  final BuildContext context;

  HomeNavigateToFavoritesEvent({
    required this.context,
  });
}

class HomeNavigateToPostNewAdEvent extends HomeEvent {
  final BuildContext context;

  HomeNavigateToPostNewAdEvent({
    required this.context,
  });
}

class HomeNavigateToFiltersEvent extends HomeEvent {
  final BuildContext context;

  HomeNavigateToFiltersEvent({
    required this.context,
  });
}

class HomeNavigateToOptionsEvent extends HomeEvent {
  final BuildContext context;

  HomeNavigateToOptionsEvent({
    required this.context,
  });
}

class HomeToLogoutEvent extends HomeEvent {
  final BuildContext context;

  HomeToLogoutEvent({
    required this.context,
  });
}
