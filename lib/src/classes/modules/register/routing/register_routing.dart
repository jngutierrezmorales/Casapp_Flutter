import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../providers/service/service_provider.dart';
import '../bloc/register_bloc.dart';
import '../view/register_page.dart';

class RegisterRouting extends StatelessWidget {
  static const routeName = "register";

  late final NavigationManager _navigationManager;
  final _serviceProvider = ServiceProvider();

  RegisterRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(this, _serviceProvider.firebaseAPIService()),
      child: RegisterPage(this),
    );
  }

  void navigateToHome(BuildContext context) {
    _navigationManager.showHome(context);
  }

  void navigateToLogin(BuildContext context) {
    _navigationManager.showLogin(context);
  }
}
