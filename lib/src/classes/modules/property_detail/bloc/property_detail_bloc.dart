import 'package:bloc/bloc.dart';
import 'package:casapp/src/classes/services/protocols/homes_service_protocol.dart';
import 'package:flutter/cupertino.dart';
import '../../../models/home_model.dart';
import '../routing/property_detail_routing.dart';

part 'property_detail_event.dart';
part 'property_detail_state.dart';

class PropertyDetailBloc extends Bloc<PropertyDetailEvent, PropertyDetailState> {
  final PropertyDetailRouting propertyDetailRouting;
  final HomesServiceProtocol homesAPIService;

  PropertyDetailBloc(this.propertyDetailRouting, this.homesAPIService): super(const PropertyDetailState());

  @override
  Stream<PropertyDetailState> mapEventToState(PropertyDetailEvent event) async* {
    if (event is GetHomeDataEvent) {
      yield* getHomeData();
    } else if (event is FavoriteHomesListEvent) {
      addHomeToFavoriteList(event);
    } else if (event is UploadDataEvent) {
      updateData(event.homeModel);
    }
  }

  Stream<PropertyDetailState> getHomeData() async* {
    final result = await homesAPIService.getHomes();
    yield PropertyDetailInitialState(result);
  }

  Future<void> updateData(HomeModel homeModel) async {
    await homesAPIService.updateData(homeModel);
  }

  void addHomeToFavoriteList (FavoriteHomesListEvent event) {
    propertyDetailRouting.navigateToFavorites(event.context, event.homeModel);
  }
}
