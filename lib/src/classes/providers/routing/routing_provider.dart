import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:casapp/src/classes/modules/favorites/routing/favorites_routing.dart';
import 'package:casapp/src/classes/modules/options/routing/options_routing.dart';
import 'package:casapp/src/classes/modules/property/routing/property_routing.dart';
import 'package:casapp/src/classes/modules/register/routing/register_routing.dart';
import 'package:casapp/src/classes/modules/search/routing/search_routing.dart';
import 'package:casapp/src/classes/modules/splash/routing/splash_routing.dart';
import 'package:casapp/src/classes/services/service_provider.dart';

import '../../modules/filters/routing/filters_routing.dart';
import '../../modules/home/routing/home_routing.dart';
import '../../modules/login/routing/login_routing.dart';

class RoutingProvider {
  late final NavigationManager _navigationManager;
  late final ServiceProvider _serviceProvider;

  RoutingProvider() {
    _navigationManager = NavigationManager();
    _serviceProvider = ServiceProvider();
  }

  LoginRouting loginRouting() {
    return LoginRouting(_navigationManager);
  }

  SplashRouting splashRouting() {
    return SplashRouting(_navigationManager);
  }

  RegisterRouting registerRouting() {
    return RegisterRouting(_navigationManager);
  }

  HomeRouting homeRouting() {
    return HomeRouting(_navigationManager);
  }

  PropertyRouting propertyRouting() {
    return PropertyRouting(_navigationManager);
  }

  FavoritesRouting favoritesRouting() {
    return FavoritesRouting(_navigationManager);
  }

  SearchRouting searchRouting() {
    return SearchRouting(_navigationManager);
  }

  FiltersRouting filtersRouting() {
    return FiltersRouting(_navigationManager);
  }

  OptionsRouting optionsRouting() {
    return OptionsRouting(_navigationManager);
  }
}
