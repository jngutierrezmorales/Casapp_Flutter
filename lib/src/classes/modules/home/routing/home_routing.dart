import 'package:casapp/src/classes/modules/home/view/home_page.dart';
import 'package:flutter/material.dart';

import '../../../managers/navigation_manager.dart';

class HomeRouting extends StatelessWidget {
  static const routeName = "home";

  late final NavigationManager _navigationManager;

  HomeRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }

  void navigateToSearch(BuildContext context) {
    _navigationManager.showSearch(context);
  }

  void navigateToFilters(BuildContext context) {
    _navigationManager.showFilters(context);
  }

  void navigateToOptions(BuildContext context) {
    _navigationManager.showOptions(context);
  }

  void logoutToLogin(BuildContext context) {
    _navigationManager.logoutToLogin(context);
  }
}
