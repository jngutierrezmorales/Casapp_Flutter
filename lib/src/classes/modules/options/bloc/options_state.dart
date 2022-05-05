abstract class OptionsState {
  const OptionsState();
}

class OptionsInitialState extends OptionsState {}

class OptionsInProgress extends OptionsState {}

class OptionsSuccess extends OptionsState {}

class OptionsFailure extends OptionsState {
  final String error;

  const OptionsFailure({required this.error});
}
