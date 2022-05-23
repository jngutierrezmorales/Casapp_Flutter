import 'package:casapp/src/classes/modules/favorites/view/favorites_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../managers/navigation_manager.dart';
import '../bloc/favorites_bloc.dart';

class FavoritesRouting extends StatelessWidget {
  static const routeName = "favorites";

  late final NavigationManager _navigationManager;

  FavoritesRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavoritesBloc(this),
      child: FavoritesPage(),
    );
  }
}
