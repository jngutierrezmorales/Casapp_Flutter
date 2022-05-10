import 'package:casapp/src/classes/modules/favorites/view/favorites_page.dart';
import 'package:flutter/material.dart';

import '../../../managers/navigation_manager.dart';

class FavoritesRouting extends StatelessWidget {
  static const routeName = "favorites";

  late final NavigationManager _navigationManager;

  FavoritesRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return FavoritesPage();
  }
}
