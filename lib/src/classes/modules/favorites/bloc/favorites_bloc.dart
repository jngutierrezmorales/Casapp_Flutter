import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../services/protocols/auth_service_protocol.dart';
import '../routing/favorites_routing.dart';

part 'favorites_state.dart';

part 'favorites_event.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRouting favoritesRouting;

  FavoritesBloc(this.favoritesRouting) : super(FavoritesInitialState());

  @override
  Stream<FavoritesEvent> mapEventState(FavoritesEvent event) async* {

  }
}