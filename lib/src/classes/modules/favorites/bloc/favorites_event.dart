part of 'favorites_bloc.dart';

class FavoritesEvent {
  const FavoritesEvent();
}

class GetFavoritesHomesEvent extends FavoritesEvent {}

class FavoritesNavigateToDetailEvent extends FavoritesEvent {
  final BuildContext context;
  HomeModel homeModel;

  FavoritesNavigateToDetailEvent({
    required this.context,
    required this.homeModel,
  });
}
