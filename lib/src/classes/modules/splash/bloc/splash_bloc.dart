import 'package:bloc/bloc.dart';
import 'package:casapp/src/classes/services/protocols/auth_service_protocol.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../models/user_model.dart';
import '../routing/splash_routing.dart';
import 'package:flutter/cupertino.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashRouting splashRouting;
  final AuthServiceProtocol authServiceProtocol;

  SplashBloc(this.splashRouting, this.authServiceProtocol)
      : super(SplashInitialState());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashCheckUserEvent) {
      checkUser();
    } else if (event is SplashNavigateToHomeEvent) {
      navigateToHome(event.context);
    } else if (event is SplashNavigateToLoginEvent) {
      navigateToLogin(event.context);
    }
  }

  Stream<SplashState> checkUser() async* {
    final user = await authServiceProtocol.firebaseCheckUser();

    if (user.email != null) yield SplashUserCheckState(user);
  }

  void navigateToLogin(BuildContext context) async {
    splashRouting.navigateToLogin(context);
  }

  void navigateToHome(BuildContext context) async {
    splashRouting.navigateToHome(context);
  }
}
