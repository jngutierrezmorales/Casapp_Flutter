abstract class UserConfigState {
  const UserConfigState();
}

class UserConfigInitialState extends UserConfigState {}

class UserConfigInProgress extends UserConfigState {}

class UserConfigSuccess extends UserConfigState {}

class UserConfigFailure extends UserConfigState {
  final String error;

  const UserConfigFailure({required this.error});
}
