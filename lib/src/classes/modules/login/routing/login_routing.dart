import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../managers/navigation_manager.dart';
import '../../../providers/service/service_provider.dart';
import '../bloc/login_bloc.dart';
import '../view/login_page.dart';

class LoginRouting extends StatelessWidget {
  static const routeName = "login";

  late final NavigationManager _navigationManager;
  final _serviceProvider = ServiceProvider();

  LoginRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(this, _serviceProvider.firebaseAPIService()),
      child: LoginPage(this),
    );
  }

  void navigateToHome(BuildContext context) {
    _navigationManager.showHome(context);
  }

  void navigateToRegister(BuildContext context) {
    _navigationManager.showRegister(context);
  }
}
