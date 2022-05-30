import 'package:bloc/bloc.dart';
import 'package:casapp/src/classes/services/protocols/homes_service_protocol.dart';
import 'package:flutter/cupertino.dart';
import '../../../models/home_model.dart';
import '../routing/property_routing.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyRouting propertyRouting;
  final HomesServiceProtocol homesAPIService;

  PropertyBloc(this.propertyRouting, this.homesAPIService) : super(const PropertyState());

  @override
  Stream<PropertyState> mapEventToState(PropertyEvent event) async* {
    if (event is PropertyNavigateToDetailEvent) {
      navigateToDetail(event);
    } else if (event is GetListHomesEvent) {
      yield* getListHomes();
    }
  }

  void navigateToDetail (PropertyNavigateToDetailEvent event) {
    propertyRouting.navigateToDetail(event.context, event.homeModel);
  }

  Stream<PropertyState> getListHomes() async* {
    final result = await homesAPIService.getHomes();
    yield PropertyInitialState(result);
  }
}
