import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:casapp/src/classes/modules/favorites/routing/favorites_routing.dart';
import 'package:casapp/src/classes/modules/options/routing/options_routing.dart';
import 'package:casapp/src/classes/modules/property/routing/property_routing.dart';
import 'package:casapp/src/classes/modules/property_detail/routing/property_detail_routing.dart';
import 'package:casapp/src/classes/modules/register/routing/register_routing.dart';
import 'package:casapp/src/classes/modules/splash/routing/splash_routing.dart';
import '../../models/home_model.dart';
import '../../modules/filters/routing/filters_routing.dart';
import '../../modules/home/routing/home_routing.dart';
import '../../modules/login/routing/login_routing.dart';
import '../../modules/post_new_ad/routing/post_new_ad_routing.dart';
import '../service/service_provider.dart';

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

  PropertyRouting propertyRouting(List<HomeModel> listHomes) {
    return PropertyRouting(_navigationManager, listHomes);
  }

  PropertyDetailRouting propertyDetailRouting(HomeModel homeModel) {
    return PropertyDetailRouting(_navigationManager, homeModel);
  }

  FavoritesRouting favoritesRouting(List<HomeModel> listFavoriteHomes) {
    return FavoritesRouting(_navigationManager, listFavoriteHomes);
  }

  PostNewAdRouting postNewAdRouting() {
    return PostNewAdRouting(_navigationManager);
  }

  FiltersRouting filtersRouting() {
    return FiltersRouting(_navigationManager);
  }

  OptionsRouting optionsRouting() {
    return OptionsRouting(_navigationManager);
  }
}
