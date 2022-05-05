import 'package:bloc/bloc.dart';
import 'package:casapp/src/classes/modules/login/routing/login_routing.dart';
import 'package:flutter/cupertino.dart';

import '../../../services/protocols/auth_service_protocol.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRouting loginRouting;
  final AuthServiceProtocol authServiceProtocol;

  LoginBloc(this.loginRouting, this.authServiceProtocol) : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginNavigateToHomeEvent) {
      navigateToHome(event);
    } else if (event is LoginAuthenticationEvent) {
      loginWithEmail(event.context, event.username, event.password);
    } else if (event is LoginNavigateToRegisterEvent) {
      navigateToRegister(event);
    }
  }

  void navigateToHome (LoginNavigateToHomeEvent event) {
    loginRouting.navigateToHome(event.context);
  }

  // user logged in
  void navigateToAuth (LoginAuthenticationEvent event) {
    loginRouting.navigateToHome(event.context);
  }

  void navigateToRegister (LoginNavigateToRegisterEvent event) {
    loginRouting.navigateToRegister(event.context);
  }

  void loginWithEmail (
      BuildContext context, String username, String password) async {
    final result = await authServiceProtocol.firebaseSignIn(username, password);

    if (!result){
      return;
    }

    loginRouting.navigateToHome(context);
  }
}
