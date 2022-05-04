import 'package:flutter/material.dart';
import '../providers/routing/routing_provider.dart';

// constructor de rutas de pantalla y su animacion

// enum de las rutas de la app
enum RouteType { login, register, home, detail }

// extension de RouteType con getter del nombre de la ruta
extension RouteTypeExtension on RouteType {
  String get name {
    switch (this) {
      case RouteType.login:
        return "login";
      case RouteType.register:
        return "register";
      case RouteType.home:
        return "home";
      case RouteType.detail:
        return "detail";
    }
  }
}

// pasar argumentos
class ArgumentsModel {
  late final RouteType routeType;
  late final Object? parameters;

  ArgumentsModel(this.routeType, this.parameters);
}

// distribuir la ruta
class RouteManager {
  late final RoutingProvider _routingProvider;

  RouteManager(this._routingProvider);

  Route createRoute(Object? arguments) {
    if (arguments != null && arguments is ArgumentsModel) {
      switch (arguments.routeType) {
        case RouteType.login:
          return _getSlidePageRoute(
              view: _routingProvider.loginRouting(),
              routeName: arguments.routeType.name);
        case RouteType.register:
          return _getSlidePageRoute(
              view: _routingProvider.registerRouting(),
              routeName: arguments.routeType.name);
        case RouteType.home:
          return _getSlidePageRoute(
              view: _routingProvider.homeRouting(),
              routeName: arguments.routeType.name);
        default:
          return _getSlidePageRoute(
              view: _routingProvider.homeRouting(),
              routeName: arguments.routeType.name);
      }
    } else {
      return _getSlidePageRoute(
        view: _routingProvider.loginRouting(),
        routeName: RouteType.login.name,
      );
    }
  }

  // definir animacion al cambiar de pantallla
  PageRouteBuilder _getSlidePageRoute({
    required Widget view,
    bool close = false,
    required String routeName,
    Duration? duration,
  }) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      transitionDuration: duration ?? const Duration(milliseconds: 700),
      pageBuilder: (context, animation, secondaryAnimation) => view,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(close ? -1.0 : 1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.decelerate;
        var tween = Tween(begin: begin, end: end);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
  }
}
