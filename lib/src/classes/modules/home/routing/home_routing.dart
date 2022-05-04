import 'package:casapp/src/classes/modules/home/view/home_page.dart';
import 'package:flutter/material.dart';

import '../../../managers/navigation_manager.dart';

class HomeRouting extends StatelessWidget {
  static const routeName = "home";

  late final NavigationManager _navigationManager;

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
