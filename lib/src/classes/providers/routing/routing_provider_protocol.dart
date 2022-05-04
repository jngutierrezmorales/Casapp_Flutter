import 'package:casapp/src/classes/modules/login/routing/login_routing.dart';

import '../../modules/home/routing/home_routing.dart';

abstract class RoutingProviderProtocol {
  LoginRouting loginRouting();
  HomeRouting homeRouting();
}