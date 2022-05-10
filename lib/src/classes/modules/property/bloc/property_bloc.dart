import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../routing/property_routing.dart';

part 'property_event.dart';
part 'property_state.dart';

class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  final PropertyRouting propertyRouting;

  PropertyBloc(this.propertyRouting) : super(PropertyInitialState());
}