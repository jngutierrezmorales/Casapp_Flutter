abstract class RegisterState {
  const RegisterState();
}

class RegisterInitialState extends RegisterState {}

class RegisterInProgress extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure({required this.error});
}
