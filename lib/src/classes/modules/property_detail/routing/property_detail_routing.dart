import 'package:flutter/material.dart';
import 'package:casapp/src/classes/managers/navigation_manager.dart';

import '../../../models/home_model.dart';
import '../view/property_detail_page.dart';

class PropertyDetailRouting extends StatelessWidget {
  static const routeName = "detail";

  late final NavigationManager _navigationManager;

  PropertyDetailRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return PropertyDetailPage();
  }
}
