import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../services/protocols/auth_service_protocol.dart';
import '../routing/favorites_routing.dart';

part 'favorites_state.dart';

part 'favorites_event.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRouting favoritesRouting;
  final AuthServiceProtocol authServiceProtocol;

  FavoritesBloc(this.favoritesRouting, this.authServiceProtocol) : super(FavoritesInitialState());

  @override
  Stream<FavoritesEvent> mapEventState(FavoritesEvent event) async* {
    if (event is FavoritesNavigateToHomeEvent) {
      navigateToHome(event);
    } else if (event is FavoritesNavigateToSearchEvent) {
      navigateToSearch(event);
    } else if (event is FavoritesNavigateToFiltersEvent) {
      navigateToFilters(event);
    } else if (event is FavoritesNavigateToOptionsEvent) {
      navigateToOptions(event);
    } else if (event is FavoritesToLogoutEvent) {
      logout(event);
    }
  }

  void navigateToHome (FavoritesNavigateToHomeEvent event) {
    favoritesRouting.navigateToHome(event.context);
  }

  void navigateToSearch (FavoritesNavigateToSearchEvent event) {
    favoritesRouting.navigateToSearch(event.context);
  }

  void navigateToFilters (FavoritesNavigateToFiltersEvent event) {
    favoritesRouting.navigateToFilters(event.context);
  }

  void navigateToOptions (FavoritesNavigateToOptionsEvent event) {
    favoritesRouting.navigateToOptions(event.context);
  }

  void logout(FavoritesToLogoutEvent event) async {
    await authServiceProtocol.firebaseSignOut();

    favoritesRouting.logoutToLogin(event.context);
  }
}