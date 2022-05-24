part of 'property_bloc.dart';

class PropertyState {
  const PropertyState();
}

class PropertyInitialState extends PropertyState {
  List<HomeModel> listHomes;
  PropertyInitialState(this.listHomes);
}
