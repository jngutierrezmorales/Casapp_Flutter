import 'dart:async';

import 'package:casapp/src/classes/modules/splash/bloc/splash_bloc.dart';
import 'package:casapp/src/classes/providers/routing/routing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  static const splashPage = "splashPage";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context)
        .add(SplashCheckUserEvent(context: context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        if (state is SplashUserCheckState) {
          if (state is SplashNavigateToHomeEvent) {
            BlocProvider.of<SplashBloc>(context).add(SplashNavigateToHomeEvent(context: context));
          }
          BlocProvider.of<SplashBloc>(context).add(SplashNavigateToLoginEvent(context: context));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/imgs/app_logo.png',
                height: 130,
              ),
              const SizedBox(
                height: 30,
              ),
              const CircularProgressIndicator(
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
