import 'package:bloc/bloc.dart';
import 'package:casapp/src/classes/services/protocols/firebase_service_protocol.dart';
import '../../../models/user_model.dart';
import '../../../services/api/firebase_api_service.dart';
import '../routing/splash_routing.dart';
import 'package:flutter/cupertino.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashRouting splashRouting;
  final FirebaseServiceProtocol firebaseAPIService;

  SplashBloc(this.splashRouting, this.firebaseAPIService)
      : super(SplashInitialState());

  @override
  Stream<SplashState> mapEventToState(SplashEvent event) async* {
    if (event is SplashCheckUserEvent) {
      checkUser(event.context);
    }
  }

  // Stream<SplashState> checkUser(BuildContext context) async* {
  //   final user = await authServiceProtocol.firebaseCheckUser();
  //
  //   //if (user.email != null) yield SplashUserCheckState(user);
  // }

  void checkUser(BuildContext context) async {
    final user = await firebaseAPIService.checkUser();

    if (user.email != null) {
      navigateToHome(context);
    } else {
      navigateToLogin(context);
    }
  }

  void navigateToLogin(BuildContext context) async {
    splashRouting.navigateToLogin(context);
  }

  void navigateToHome(BuildContext context) async {
    splashRouting.navigateToHome(context);
  }
}
