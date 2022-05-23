import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:flutter/cupertino.dart';
import '../view/search_page.dart';

class SearchRouting extends StatelessWidget {
  static const routeName = "search";

  late final NavigationManager _navigationManager;

  SearchRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return SearchPage(this);
  }
}
