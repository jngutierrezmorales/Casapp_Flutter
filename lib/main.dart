import 'package:casapp/src/classes/managers/route_manager.dart';
import 'package:casapp/src/classes/modules/favorites/bloc/favorites_bloc.dart';
import 'package:casapp/src/classes/modules/home/bloc/home_bloc.dart';
import 'package:casapp/src/classes/modules/login/bloc/login_bloc.dart';
import 'package:casapp/src/classes/modules/property/bloc/property_bloc.dart';
import 'package:casapp/src/classes/modules/register/bloc/register_bloc.dart';
import 'package:casapp/src/classes/modules/splash/bloc/splash_bloc.dart';
import 'package:casapp/src/classes/providers/routing/routing_provider.dart';
import 'package:casapp/src/classes/services/service_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

// async -> Future, async* -> Stream

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final _routingProvider = RoutingProvider();
  final _routeManager = RouteManager(_routingProvider);
  final _serviceProvider = ServiceProvider();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => SplashBloc(
              _routingProvider.splashRouting(), _serviceProvider.authService()),
        ),
        BlocProvider(
          create: (_) => HomeBloc(
              _routingProvider.homeRouting(), _serviceProvider.authService()),
        ),
        BlocProvider(
          create: (_) => LoginBloc(
              _routingProvider.loginRouting(), _serviceProvider.authService()),
        ),
        BlocProvider(
          create: (_) => RegisterBloc(_routingProvider.registerRouting(),
              _serviceProvider.authService()),
        ),
        BlocProvider(
          create: (_) => PropertyBloc(_routingProvider.propertyRouting()),
        ),
        BlocProvider(
          create: (_) => FavoritesBloc(_routingProvider.favoritesRouting()),
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
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
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
