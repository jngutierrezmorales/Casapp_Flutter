import 'package:casapp/src/classes/providers/service/service_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../managers/navigation_manager.dart';
import '../../../models/home_model.dart';
import '../bloc/post_new_ad_bloc.dart';
import '../view/post_new_ad_page.dart';

class PostNewAdRouting extends StatelessWidget {
  static const routeName = "postNewAd";

  late final NavigationManager _navigationManager;
  final _serviceProvider = ServiceProvider();

  PostNewAdRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostNewAdBloc(this, _serviceProvider.homesAPIService()),
      child: PostNewAdPage(),
    );
  }
}
