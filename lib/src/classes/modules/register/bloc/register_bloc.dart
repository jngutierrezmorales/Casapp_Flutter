import 'package:casapp/src/classes/modules/register/bloc/register_event.dart';
import 'package:casapp/src/classes/modules/register/bloc/register_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../services/protocols/firebase_service_protocol.dart';
import '../routing/register_routing.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRouting registerRouting;
  final FirebaseServiceProtocol firebaseAPIService;

  RegisterBloc(this.registerRouting, this.firebaseAPIService)
      : super(RegisterInitialState());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterNavigateToHomeEvent) {
      navigateToHome(event);
    } else if (event is RegisterAuthenticationEvent) {
      registerWithEmail(event.context, event.username, event.password);
    } else if (event is RegisterNavigateToLoginEvent) {
      navigateToLogin(event);
    }
  }

  void navigateToHome(RegisterNavigateToHomeEvent event) {
    registerRouting.navigateToHome(event.context);
  }

  void navigateToLogin(RegisterNavigateToLoginEvent event) {
    registerRouting.navigateToLogin(event.context);
  }

  void navigateAuth(RegisterAuthenticationEvent event) {
    registerRouting.navigateToHome(event.context);
  }

  void registerWithEmail(
      BuildContext context, String username, String password) async {
    final result =
        await firebaseAPIService.signUp(username, password);

    if (result) {
      registerRouting.navigateToHome(context);
    }
  }
}
