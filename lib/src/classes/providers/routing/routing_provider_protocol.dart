import 'package:casapp/src/classes/modules/login/routing/login_routing.dart';
import 'package:casapp/src/classes/modules/register/routing/register_routing.dart';

import '../../modules/home/routing/home_routing.dart';

abstract class RoutingProviderProtocol {
  HomeRouting homeRouting();
  LoginRouting loginRouting();
  RegisterRouting registerRouting();
}