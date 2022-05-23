import 'package:casapp/src/classes/modules/property/view/property_page.dart';
import 'package:casapp/src/classes/providers/service/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../managers/navigation_manager.dart';
import '../../../models/home_model.dart';
import '../bloc/property_bloc.dart';

class PropertyRouting extends StatelessWidget {
  static const routeName = "property";

  late final NavigationManager _navigationManager;
  final _serviceProvider = ServiceProvider();

  PropertyRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PropertyBloc(this, _serviceProvider.homesAPIService()),
      child: PropertyPage(),
    );
  }

  void navigateToDetail(BuildContext context, HomeModel homeModel) {
    _navigationManager.showPropertyDetail(context, homeModel);
  }
}
