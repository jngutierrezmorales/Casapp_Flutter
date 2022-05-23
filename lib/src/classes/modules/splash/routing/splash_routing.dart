import 'package:casapp/src/classes/modules/splash/view/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../managers/navigation_manager.dart';
import '../../../providers/service/service_provider.dart';
import '../bloc/splash_bloc.dart';

class SplashRouting extends StatelessWidget {
  static const routeName = "splash";

  late final NavigationManager _navigationManager;
  final _serviceProvider = ServiceProvider();

  SplashRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(this, _serviceProvider.firebaseAPIService()),
      child: SplashPage(),
    );
  }

  void navigateToLogin(BuildContext context) {
    _navigationManager.showLogin(context);
  }

  void navigateToHome(BuildContext context) {
    _navigationManager.showHome(context);
  }
}
