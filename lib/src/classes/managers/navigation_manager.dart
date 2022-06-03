import 'package:casapp/src/classes/managers/route_manager.dart';
import 'package:casapp/src/classes/modules/home/routing/home_routing.dart';
import 'package:casapp/src/classes/modules/login/routing/login_routing.dart';
import 'package:casapp/src/classes/modules/register/routing/register_routing.dart';
import 'package:flutter/cupertino.dart';
import '../models/home_model.dart';
import '../modules/favorites/routing/favorites_routing.dart';
import '../modules/options/routing/options_routing.dart';
import '../modules/post_new_ad/routing/post_new_ad_routing.dart';
import '../modules/property/routing/property_routing.dart';
import '../modules/property_detail/routing/property_detail_routing.dart';
import '../modules/splash/routing/splash_routing.dart';
import '../modules/user_config/routing/user_config_routing.dart';

// push de la pantalla que se va a mostrar

class NavigationManager {
  void showHome(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, HomeRouting.routeName,
        arguments: ArgumentsModel(RouteType.home, close));
  }

  void showProperty(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, PropertyRouting.routeName,
        arguments: ArgumentsModel(RouteType.property, close));
  }

  void showPropertyDetail(BuildContext context, HomeModel homeModel) {
    Navigator.pushNamed(context, PropertyDetailRouting.routeName,
        arguments: ArgumentsModel(RouteType.detail, homeModel));
  }

  void showFavorites(BuildContext context, HomeModel homeModel) {
    Navigator.pushNamed(context, FavoritesRouting.routeName,
        arguments: ArgumentsModel(RouteType.favorites, homeModel));
  }

  void showSplash(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, SplashRouting.routeName,
        arguments: ArgumentsModel(RouteType.splash, close));
  }

  void showLogin(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, LoginRouting.routeName,
        arguments: ArgumentsModel(RouteType.login, close));
  }

  void showRegister(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, RegisterRouting.routeName,
        arguments: ArgumentsModel(RouteType.register, close));
  }

  void showPostNewAd(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, PostNewAdRouting.routeName,
    arguments: ArgumentsModel(RouteType.postNewAd, close));
  }

  void showUserConfig(BuildContext context, [bool close = false]) {
    Navigator.pushNamed(context, UserConfigRouting.routeName,
    arguments: ArgumentsModel(RouteType.userConfig, close));
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
