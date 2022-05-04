import 'package:casapp/src/classes/managers/route_manager.dart';
import 'package:casapp/src/classes/modules/home/routing/home_routing.dart';
import 'package:casapp/src/classes/modules/login/routing/login_routing.dart';
import 'package:casapp/src/classes/modules/register/routing/register_routing.dart';
import 'package:flutter/cupertino.dart';

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

  void pop(BuildContext context, [dynamic result]) {
    Navigator.pop(context, result);
  }
}
