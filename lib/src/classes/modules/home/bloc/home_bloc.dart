import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../services/protocols/firebase_service_protocol.dart';
import '../routing/home_routing.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRouting homeRouting;
  final FirebaseServiceProtocol firebaseAPIService;

  HomeBloc(this.homeRouting, this.firebaseAPIService) : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeNavigateToSearchEvent) {
      navigateToSearch(event);
    } else if (event is HomeNavigateToFiltersEvent) {
      navigateToFilters(event);
    } else if (event is HomeNavigateToOptionsEvent) {
      navigateToOptions(event);
    } else if (event is HomeToLogoutEvent) {
      logout(event);
    }
  }

  void navigateToSearch (HomeNavigateToSearchEvent event) {
    homeRouting.navigateToSearch(event.context);
  }

  void navigateToFilters (HomeNavigateToFiltersEvent event) {
    homeRouting.navigateToFilters(event.context);
  }

  void navigateToOptions (HomeNavigateToOptionsEvent event) {
    homeRouting.navigateToOptions(event.context);
  }

  void logout (HomeToLogoutEvent event) async {
    await firebaseAPIService.signOut();

    homeRouting.logoutToLogin(event.context);
  }
}
