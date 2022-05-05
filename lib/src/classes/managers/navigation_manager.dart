import 'package:casapp/src/classes/managers/route_manager.dart';
import 'package:casapp/src/classes/modules/home/routing/home_routing.dart';
import 'package:casapp/src/classes/modules/login/routing/login_routing.dart';
import 'package:casapp/src/classes/modules/register/routing/register_routing.dart';
import 'package:flutter/cupertino.dart';

import '../modules/filters/routing/filters_routing.dart';
import '../modules/options/routing/options_routing.dart';
import '../modules/search/routing/search_routing.dart';

// push de la pantalla que se va a mostrar

class NavigationManager {
  void showHome(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, HomeRouting.routeName,
        arguments: ArgumentsModel(RouteType.home, close));
  }

  void showLogin(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, LoginRouting.routeName,
        arguments: ArgumentsModel(RouteType.login, close));
  }

  void showRegister(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, RegisterRouting.routeName,
        arguments: ArgumentsModel(RouteType.register, close));
  }

  void showSearch(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, SearchRouting.routeName,
    arguments: ArgumentsModel(RouteType.search, close));
  }

  void showFilters(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, FiltersRouting.routeName,
    arguments: ArgumentsModel(RouteType.filters, close));
  }

  void showOptions(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, OptionsRouting.routeName,
        arguments: ArgumentsModel(RouteType.options, close));
  }

  void logoutToLogin(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, LoginRouting.routeName,
        arguments: ArgumentsModel(RouteType.logout, close));
  }

  void pop(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }
}
