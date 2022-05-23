import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:flutter/cupertino.dart';
import '../view/filters_page.dart';

class FiltersRouting extends StatelessWidget {
  static const routeName = "filters";

  late final NavigationManager _navigationManager;

  FiltersRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return FiltersPage(this);
  }
}
