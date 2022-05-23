import 'package:casapp/src/classes/managers/navigation_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../providers/service/service_provider.dart';
import '../bloc/options_bloc.dart';
import '../view/options_page.dart';

class OptionsRouting extends StatelessWidget {
  static const routeName = "options";

  late final NavigationManager _navigationManager;
  final _serviceProvider = ServiceProvider();

  OptionsRouting(this._navigationManager);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OptionsBloc(this, _serviceProvider.firebaseAPIService()),
      child: OptionsPage(this),
    );
  }

  void navigateToHome(BuildContext context) {
    _navigationManager.showHome(context);
  }
}
