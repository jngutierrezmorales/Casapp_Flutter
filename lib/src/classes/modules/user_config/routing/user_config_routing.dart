import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:flutter/cupertino.dart';
import '../view/user_config_page.dart';

class UserConfigRouting extends StatelessWidget {
  static const routeName = "user_config";

  late final NavigationManager _navigationManager;

  UserConfigRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return UserConfigPage(this);
  }
}
