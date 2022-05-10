import 'package:bloc/bloc.dart';
import '../routing/splash_routing.dart';
import 'package:flutter/cupertino.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final SplashRouting splashRouting;

  SplashBloc(this.splashRouting) : super(SplashInitialState());
}