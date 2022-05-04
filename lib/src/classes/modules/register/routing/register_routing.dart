import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:flutter/cupertino.dart';

import '../view/register_page.dart';

class RegisterRouting extends StatelessWidget {
  static const routeName = "register";

  late final NavigationManager _navigationManager;

  RegisterRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return RegisterPage(this);
  }

  void navigateToHome(BuildContext context) {
    _navigationManager.showHome(context);
  }

  void navigateToLogin(BuildContext context) {
    _navigationManager.showLogin(context);
  }
}
