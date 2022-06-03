import 'package:casapp/src/classes/managers/route_manager.dart';
import 'package:casapp/src/classes/modules/home/bloc/home_bloc.dart';
import 'package:casapp/src/classes/modules/splash/bloc/splash_bloc.dart';
import 'package:casapp/src/classes/providers/routing/routing_provider.dart';
import 'package:casapp/src/classes/providers/service/service_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final _routingProvider = RoutingProvider();
  final _routeManager = RouteManager(_routingProvider);
  final _serviceProvider = ServiceProvider();

  runApp(
    MultiBlocProvider(
      providers: [
        //TODO: initialize common blocproviders in main and separate the isolated ones in their routing
        BlocProvider(
          create: (_) => SplashBloc(_routingProvider.splashRouting(),
              _serviceProvider.firebaseAPIService()),
        ),
        BlocProvider(
          create: (_) => HomeBloc(
              _routingProvider.homeRouting(),
              _serviceProvider.firebaseAPIService(),
              _serviceProvider.homesAPIService()),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (_) {},
        child: MyApp(
          routeManager: _routeManager,
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final RouteManager routeManager;

  MyApp({required this.routeManager});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Casapp',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        fontFamily: 'Roboto',
      ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      initialRoute: RouteType.splash.name,
      onGenerateRoute: (settings) {
        final args = settings.arguments;
        for (RouteType value in RouteType.values) {
          if (value.name == settings.name) {
            return widget.routeManager.createRoute(args);
          }
        }
      },
    );
  }
}
