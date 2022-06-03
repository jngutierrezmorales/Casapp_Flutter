import 'package:bloc/bloc.dart';
import 'package:casapp/src/classes/services/protocols/homes_service_protocol.dart';
import 'package:flutter/cupertino.dart';
import '../../../models/home_model.dart';
import '../routing/favorites_routing.dart';

part 'favorites_state.dart';
part 'favorites_event.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRouting favoritesRouting;
  final HomesServiceProtocol homesAPIService;

  FavoritesBloc(this.favoritesRouting, this.homesAPIService) : super(const FavoritesState());

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) async* {
    if (event is FavoritesNavigateToDetailEvent) {
      navigateToDetail(event);
    }
  }

  void navigateToDetail (FavoritesNavigateToDetailEvent event) {
    favoritesRouting.navigateToDetail(event.context, event.homeModel);
  }
}
