import 'package:casapp/src/classes/modules/options/routing/options_routing.dart';
import 'package:casapp/src/classes/services/protocols/auth_service_protocol.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'options_event.dart';
import 'options_state.dart';

class OptionsBloc extends Bloc<OptionsEvent, OptionsState> {
  final OptionsRouting optionsRouting;
  final AuthServiceProtocol authServiceProtocol;

  OptionsBloc(this.optionsRouting, this.authServiceProtocol) : super(OptionsInitialState());

  @override
  Stream<OptionsState> mapEventToState(OptionsEvent event) async* {
    if (event is OptionsUpdateUserNameEvent) {
      userUpdateName(event.context, event.username);
    } else if (event is OptionsNavigateToHomeEvent) {
      navigateToHome(event);
    }
  }

  void navigateToHome (OptionsNavigateToHomeEvent event) {
    optionsRouting.navigateToHome(event.context);
  }

  void userUpdateName(BuildContext context, String username) async {
    await authServiceProtocol.firebaseUpdateUserName(username);
  }
}