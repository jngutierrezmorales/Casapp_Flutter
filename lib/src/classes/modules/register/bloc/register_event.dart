import 'package:flutter/cupertino.dart';

class RegisterEvent {
  const RegisterEvent();
}

class RegisterNavigateToHomeEvent extends RegisterEvent {
  final BuildContext context;

  RegisterNavigateToHomeEvent({
    required this.context,
  });
}

class RegisterNavigateToLoginEvent extends RegisterEvent {
  final BuildContext context;

  RegisterNavigateToLoginEvent({
    required this.context,
  });
}

class RegisterAuthenticationEvent extends RegisterEvent {
  final BuildContext context;
  final String username;
  final String password;

  RegisterAuthenticationEvent({
    required this.context,
    required this.username,
    required this.password,
  });
}
