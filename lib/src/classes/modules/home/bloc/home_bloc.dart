import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../models/home_model.dart';
import '../../../services/protocols/firebase_service_protocol.dart';
import '../../../services/protocols/homes_service_protocol.dart';
import '../routing/home_routing.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRouting homeRouting;
  final FirebaseServiceProtocol firebaseAPIService;
  final HomesServiceProtocol homesAPIService;

  HomeBloc(this.homeRouting, this.firebaseAPIService, this.homesAPIService) : super(HomeInitialState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeNavigateToPostNewAdEvent) {
      navigateToPostNewAd(event);
    } else if (event is HomeNavigateToUserConfigEvent) {
      navigateToUserConfig(event);
    } else if (event is HomeNavigateToOptionsEvent) {
      navigateToOptions(event);
    } else if (event is HomeToLogoutEvent) {
      logout(event);
    } else if (event is HomeGetHomesEvent) {
      yield* getListHomes();
    }
  }

  Stream<HomeState> getListHomes () async* {
    yield HomeInProgress();
    final result = await homesAPIService.getHomes();

    if (result == null) {
      yield const HomeFailure(error: 'Get Homes Error');
    } else {
      yield HomeSuccess(listHomes: result);
    }
  }

  void navigateToPostNewAd (HomeNavigateToPostNewAdEvent event) {
    homeRouting.navigateToPostNewAd(event.context);
  }

  void navigateToUserConfig (HomeNavigateToUserConfigEvent event) {
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
