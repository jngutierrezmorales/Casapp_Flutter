import 'package:flutter/material.dart';

import '../../../managers/navigation_manager.dart';
import '../view/login_page.dart';

class LoginRouting extends StatelessWidget {
  static const routeName = "login";

  late final NavigationManager _navigationManager;

  LoginRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return LoginPage(this);
  }

  void navigateToHome(BuildContext context) {
    _navigationManager.showHome(context);
  }

  void navigateToRegister(BuildContext context) {
    _navigationManager.showRegister(context);
  }
}
