import 'package:bloc/bloc.dart';
import 'package:casapp/src/classes/services/protocols/homes_service_protocol.dart';
import 'package:flutter/cupertino.dart';
import '../../../models/home_model.dart';
import '../routing/property_detail_routing.dart';

part 'property_detail_event.dart';
part 'property_detail_state.dart';

class PropertyDetailBloc extends Bloc<PropertyDetailEvent, PropertyDetailState> {
  final PropertyDetailRouting propertyDetailRouting;
  final HomesServiceProtocol homesService;

  PropertyDetailBloc(this.propertyDetailRouting, this.homesService): super(PropertyDetailInitialState());

  @override
  Stream<PropertyDetailState> mapEventToState(PropertyDetailEvent event) async* {
    if (event is GetHomesDataEvent) {
      getHomesData();
    }
  }

  Future<List<HomeModel>> getHomesData() async {
    final result = await homesService.getHomes();
    return result;
  }
}
