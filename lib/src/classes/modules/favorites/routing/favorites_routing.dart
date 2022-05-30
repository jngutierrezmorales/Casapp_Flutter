import 'package:casapp/src/classes/modules/favorites/view/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../managers/navigation_manager.dart';
import '../../../models/home_model.dart';
import '../../../providers/service/service_provider.dart';
import '../bloc/favorites_bloc.dart';

class FavoritesRouting extends StatelessWidget {
  static const routeName = "favorites";

  late final NavigationManager _navigationManager;
  final _serviceProvider = ServiceProvider();
  List<HomeModel> listFavoriteHomes;

  FavoritesRouting(this._navigationManager, this.listFavoriteHomes);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesBloc(this, _serviceProvider.homesAPIService()),
      child: FavoritesPage(listFavoriteHomes),
    );
  }
}
