part of 'login_bloc.dart';

class LoginEvent {
  const LoginEvent();
}

class LoginNavigateToHomeEvent extends LoginEvent {
  final BuildContext context;

  LoginNavigateToHomeEvent({
    required this.context,
  });
}

class LoginNavigateToRegisterEvent extends LoginEvent {
  final BuildContext context;

  LoginNavigateToRegisterEvent({
    required this.context,
  });
}

class LoginAuthenticationEvent extends LoginEvent {
  final BuildContext context;
  final String username;
  final String password;

  LoginAuthenticationEvent({
    required this.context,
    required this.username,
    required this.password,
  });
}
