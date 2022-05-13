import 'package:flutter/cupertino.dart';

class OptionsEvent {
  const OptionsEvent();
}

class OptionsUpdateUserNameEvent extends OptionsEvent {
  final BuildContext context;
  final String username;

  OptionsUpdateUserNameEvent({
    required this.context,
    required this.username,
  });
}

class OptionsNavigateToHomeEvent extends OptionsEvent {
  final BuildContext context;

  OptionsNavigateToHomeEvent({
    required this.context,
  });
}
