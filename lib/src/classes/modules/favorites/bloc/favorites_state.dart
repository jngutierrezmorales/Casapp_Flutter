part of 'favorites_bloc.dart';

class FavoritesState {
  const FavoritesState();
}

class FavoritesInProgress extends FavoritesState {}

class FavoritesInitialState extends FavoritesState {
  List<HomeModel> listFavoritesHomes;

  FavoritesInitialState(this.listFavoritesHomes);
}

class FavoritesSuccess extends FavoritesState {
  List<HomeModel> listFavoritesHomes;

  FavoritesSuccess({required this.listFavoritesHomes});
}

class FavoritesFailure extends FavoritesState {
  final String error;

  const FavoritesFailure({required this.error});
}
