import 'package:casapp/src/classes/widgets/home/bloc/home_event.dart';
import 'package:casapp/src/classes/widgets/home/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeInitialState homeInitialState) : super(HomeInitialState());
}
