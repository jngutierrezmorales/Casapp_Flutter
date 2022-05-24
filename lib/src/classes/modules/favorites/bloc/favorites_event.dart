part of 'favorites_bloc.dart';

class FavoritesEvent {
  const FavoritesEvent();
}

class GetFavoritesHomesEvent extends FavoritesEvent {
  final BuildContext context;

  GetFavoritesHomesEvent({
    required this.context,
  });
}
