import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:flutter/cupertino.dart';

import '../view/options_page.dart';

class OptionsRouting extends StatelessWidget {
  static const routeName = "options";

  late final NavigationManager _navigationManager;

  OptionsRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return OptionsPage(this);
  }

  void navigateToHome(BuildContext context) {
    _navigationManager.showHome(context);
  }
}
