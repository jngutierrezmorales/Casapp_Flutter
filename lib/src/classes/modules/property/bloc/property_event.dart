part of 'property_bloc.dart';

class PropertyEvent {
  const PropertyEvent();
}

class PropertyNavigateToDetailEvent extends PropertyEvent {
  final BuildContext context;
  HomeModel homeModel;

  PropertyNavigateToDetailEvent({
    required this.context,
    required this.homeModel,
  });
}

class GetListHomesEvent extends PropertyEvent {}
