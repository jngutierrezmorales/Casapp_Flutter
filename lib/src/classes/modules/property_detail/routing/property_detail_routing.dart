import 'package:flutter/material.dart';
import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/home_model.dart';
import '../../../providers/service/service_provider.dart';
import '../bloc/property_detail_bloc.dart';
import '../view/property_detail_page.dart';

class PropertyDetailRouting extends StatelessWidget {
  static const routeName = "detail";

  late final NavigationManager _navigationManager;
  final _serviceProvider = ServiceProvider();
  HomeModel homeModel;

  PropertyDetailRouting(this._navigationManager, this.homeModel);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PropertyDetailBloc(this, _serviceProvider.homesAPIService()),
      child: PropertyDetailPage(homeModel),
    );
  }

  void navigateToFavorites(BuildContext context, HomeModel homeModel) {
    _navigationManager.showFavorites(context, homeModel);
  }
}
