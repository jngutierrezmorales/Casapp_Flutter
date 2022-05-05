abstract class FiltersState {
  const FiltersState();
}

class FiltersInitialState extends FiltersState {}

class FiltersInProgress extends FiltersState {}

class FiltersSuccess extends FiltersState {}

class FiltersFailure extends FiltersState {
  final String error;

  const FiltersFailure({required this.error});
}
