import 'package:casapp/src/classes/modules/splash/view/splash_page.dart';
import 'package:flutter/material.dart';

import '../../../managers/navigation_manager.dart';

class SplashRouting extends StatelessWidget {
  static const routeName = "splash";

  late final NavigationManager _navigationManager;

  SplashRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return SplashPage();
  }
}
