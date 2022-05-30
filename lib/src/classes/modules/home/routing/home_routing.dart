import 'package:casapp/src/classes/modules/home/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../managers/navigation_manager.dart';
import '../../../providers/service/service_provider.dart';
import '../bloc/home_bloc.dart';

class HomeRouting extends StatelessWidget {
  static const routeName = "home";

  late final NavigationManager _navigationManager;
  final _serviceProvider = ServiceProvider();

  HomeRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(this, _serviceProvider.firebaseAPIService(), _serviceProvider.homesAPIService()),
      child: HomePage(),
    );
  }

  void navigateToPostNewAd(BuildContext context) {
    _navigationManager.showPostNewAd(context);
  }

  void navigateToFilters(BuildContext context) {
    _navigationManager.showFilters(context);
  }

  void navigateToOptions(BuildContext context) {
    _navigationManager.showOptions(context);
  }

  void logoutToLogin(BuildContext context) {
    _navigationManager.logoutToLogin(context);
  }
}
