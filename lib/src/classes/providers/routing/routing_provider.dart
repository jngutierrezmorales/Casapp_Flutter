import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:casapp/src/classes/modules/register/routing/register_routing.dart';
import 'package:casapp/src/classes/services/service_provider.dart';

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

  RegisterRouting registerRouting() {
    return RegisterRouting(_navigationManager);
  }

  HomeRouting homeRouting() {
    return HomeRouting();
  }
}
