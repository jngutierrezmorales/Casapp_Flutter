import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../managers/navigation_manager.dart';
import '../bloc/post_new_ad_bloc.dart';
import '../view/post_new_ad_page.dart';

class PostNewAdRouting extends StatelessWidget {
  static const routeName = "postNewAd";

  late final NavigationManager _navigationManager;

  PostNewAdRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PostNewAdBloc(this),
      child: PostNewAdPage(this),
    );
  }
}
