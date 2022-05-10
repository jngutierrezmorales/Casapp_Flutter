import 'package:casapp/src/classes/modules/property/view/property_page.dart';
import 'package:flutter/material.dart';

import '../../../managers/navigation_manager.dart';

class PropertyRouting extends StatelessWidget {
  static const routeName = "property";

  late final NavigationManager _navigationManager;

  PropertyRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return PropertyPage();
  }
}
