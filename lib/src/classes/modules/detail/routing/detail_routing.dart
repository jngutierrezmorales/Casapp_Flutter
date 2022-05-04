import 'package:flutter/material.dart';

import '../../../managers/navigation_manager.dart';
import '../view/detail_page.dart';

class DetailRouting extends StatelessWidget {
  static const routeName = "detail";

  late final NavigationManager _navigationManager;

  DetailRouting(NavigationManager navigationManager) {
    _navigationManager = navigationManager;
  }

  @override
  Widget build(BuildContext context) {
    return DetailPage();
  }
}