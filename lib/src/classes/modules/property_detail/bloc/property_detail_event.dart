part of 'property_detail_bloc.dart';

class PropertyDetailEvent {
  const PropertyDetailEvent();
}

class GetHomesDataEvent extends PropertyDetailEvent {
  final BuildContext context;

  GetHomesDataEvent({
    required this.context,
  });
}
