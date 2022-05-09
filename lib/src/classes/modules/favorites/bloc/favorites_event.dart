part of 'favorites_bloc.dart';

class FavoritesEvent {
  const FavoritesEvent();
}

class FavoritesNavigateToSearchEvent extends FavoritesEvent {
  final BuildContext context;

  FavoritesNavigateToSearchEvent({
    required this.context,
  });
}

class FavoritesNavigateToFiltersEvent extends FavoritesEvent {
  final BuildContext context;

  FavoritesNavigateToFiltersEvent({
    required this.context,
  });
}

class FavoritesNavigateToOptionsEvent extends FavoritesEvent {
  final BuildContext context;

  FavoritesNavigateToOptionsEvent({
    required this.context,
  });
}

class FavoritesToLogoutEvent extends FavoritesEvent {
  final BuildContext context;

  FavoritesToLogoutEvent({
    required this.context,
  });
}

class FavoritesNavigateToHomeEvent extends FavoritesEvent {
  final BuildContext context;

  FavoritesNavigateToHomeEvent({
    required this.context,
  });
}
