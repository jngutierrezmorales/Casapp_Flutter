import 'dart:async';

import 'package:casapp/src/classes/modules/splash/bloc/splash_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  static const splashPage = "splashPage";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late SplashBloc _splashBloc;

  @override
  void initState() {
    _splashBloc = BlocProvider.of<SplashBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: BlocBuilder<SplashBloc, SplashState>(
          builder: (context, state) {
            if (state is SplashInitialState) {
              Timer(
                const Duration(seconds: 2),
                () => _splashBloc.add(SplashCheckUserEvent(context: context)),
              );
            }
            return Center(
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
            );
          },
        ),
      ),
    );
  }
}
