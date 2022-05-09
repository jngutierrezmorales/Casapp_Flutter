part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesState {
  const FavoritesState();
}

class FavoritesInitialState extends FavoritesState {}

class FavoritesInProgress extends FavoritesState {}

class FavoritesSuccess extends FavoritesState {}

class FavoritesFailure extends FavoritesState {
  final String error;

  const FavoritesFailure({required this.error});
}
