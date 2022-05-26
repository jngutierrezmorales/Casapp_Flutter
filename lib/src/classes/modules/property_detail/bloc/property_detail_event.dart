part of 'property_detail_bloc.dart';

class PropertyDetailEvent {
  const PropertyDetailEvent();
}

class GetHomeDataEvent extends PropertyDetailEvent {
  final BuildContext context;

  GetHomeDataEvent({
    required this.context,
  });
}

class FavoriteHomesListEvent extends PropertyDetailEvent {
  final BuildContext context;
  HomeModel homeModel;

  FavoriteHomesListEvent({
    required this.context,
    required this.homeModel,
  });
}
