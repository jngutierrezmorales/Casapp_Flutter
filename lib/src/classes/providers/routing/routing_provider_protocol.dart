import 'package:casapp/src/classes/modules/login/routing/login_routing.dart';
import 'package:casapp/src/classes/modules/register/routing/register_routing.dart';
import '../../modules/favorites/routing/favorites_routing.dart';
import '../../modules/home/routing/home_routing.dart';
import '../../modules/options/routing/options_routing.dart';
import '../../modules/post_new_ad/routing/post_new_ad_routing.dart';
import '../../modules/property/routing/property_routing.dart';
import '../../modules/property_detail/routing/property_detail_routing.dart';
import '../../modules/splash/routing/splash_routing.dart';
import '../../modules/user_config/routing/user_config_routing.dart';

abstract class RoutingProviderProtocol {
  LoginRouting loginRouting();
  SplashRouting splashRouting();
  RegisterRouting registerRouting();
  HomeRouting homeRouting();
  PropertyRouting propertyRouting();
  PropertyDetailRouting propertyDetailRouting();
  FavoritesRouting favoritesRouting();
  PostNewAdRouting searchRouting();
  UserConfigRouting userConfigRouting();
  OptionsRouting optionsRouting();
}
