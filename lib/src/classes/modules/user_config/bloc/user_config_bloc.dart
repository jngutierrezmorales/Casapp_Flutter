import 'package:casapp/src/classes/modules/user_config/routing/user_config_routing.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_config_state.dart';

class UserConfigBloc extends Bloc<UserConfigBloc, UserConfigState> {
  final UserConfigRouting userConfigRouting;

  UserConfigBloc(this.userConfigRouting) : super(UserConfigInitialState());
}
