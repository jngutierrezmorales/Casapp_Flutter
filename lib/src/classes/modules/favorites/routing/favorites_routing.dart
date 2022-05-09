import 'package:casapp/src/classes/modules/favorites/view/favorites_page.dart';
import 'package:flutter/material.dart';

import '../../../managers/navigation_manager.dart';

class FavoritesRouting extends StatelessWidget {
  static const routeName = "favorites";

  late final NavigationManager _navigationManager;

  FavoritesRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return FavoritesPage(this);
  }

  void navigateToHome(BuildContext context) {
    _navigationManager.showHome(context);
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
