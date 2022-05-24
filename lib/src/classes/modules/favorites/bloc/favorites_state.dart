part of 'favorites_bloc.dart';

class FavoritesState {
  const FavoritesState();
}

class FavoritesInitialState extends FavoritesState {
  List<HomeModel> listHomes;
  FavoritesInitialState(this.listHomes);
}
