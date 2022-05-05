import 'package:casapp/src/classes/modules/options/routing/options_routing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'options_event.dart';
import 'options_state.dart';

class OptionsBloc extends Bloc<OptionsEvent, OptionsState> {
  final OptionsRouting optionsRouting;

  OptionsBloc(this.optionsRouting) : super(OptionsInitialState());
}