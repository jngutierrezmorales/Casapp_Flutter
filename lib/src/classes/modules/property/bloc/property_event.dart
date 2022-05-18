part of 'property_bloc.dart';

class PropertyEvent {
  const PropertyEvent();
}

class PropertyNavigateToDetailEvent extends PropertyEvent {
  final BuildContext context;

  PropertyNavigateToDetailEvent({
    required this.context,
  });
}
