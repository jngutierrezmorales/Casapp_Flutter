import 'package:casapp/src/classes/modules/filters/routing/filters_routing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersBloc, FiltersState> {
  final FiltersRouting filtersRouting;

  FiltersBloc(this.filtersRouting) : super(FiltersInitialState());
}
