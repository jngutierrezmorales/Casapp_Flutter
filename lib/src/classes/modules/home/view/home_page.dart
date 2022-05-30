import 'package:casapp/src/classes/modules/home/bloc/home_bloc.dart';
import 'package:casapp/src/classes/providers/routing/routing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../../models/home_model.dart';

class HomePage extends StatefulWidget {
  static const homePage = "homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  int _selectedTab = 0;
  List<HomeModel> listHomes = [];

  List<Widget> _widgets = [];

  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(HomeGetHomesEvent());
    super.initState();
  }

  void _loadViews(List<HomeModel> listHomes) {
    _widgets = [
      RoutingProvider().propertyRouting(listHomes),
      RoutingProvider().favoritesRouting(listHomes),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Casapp'),
          //automaticallyImplyLeading: false,
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 180,
                width: double.infinity,
                padding: const EdgeInsets.only(top: 50, bottom: 5),
                alignment: Alignment.centerLeft,
                color: Colors.black,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/imgs/drawer_logo.jpg'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text(
                  "Publicar anuncio",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {},
                ),
                onTap: _goToPostNewAd,
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: const Text(
                  "Filtros",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.filter_alt),
                  onPressed: () {},
                ),
                onTap: _goToFilters,
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: const Text(
                  "Opciones",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {},
                ),
                onTap: _goToOptions,
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: const Text(
                  "Salir",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {},
                ),
                onTap: _logout,
              ),
              const Divider(
                color: Colors.grey,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: const Center(
                  child: Text("Casapp 1.0"),
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInProgress) {
              return Center(child: CircularProgressIndicator());
            } else if (state is HomeSuccess) {
              _loadViews(state.listHomes);
              return _widgets.elementAt(_selectedTab);
            } else {
              return Text("Error");
            }
          },
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(5),
          child: SalomonBottomBar(
            margin: const EdgeInsets.all(0),
            currentIndex: _selectedTab,
            onTap: (position) {
              setState(() {
                _selectedTab = position;
              });
            },
            items: [
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Inicio"),
                selectedColor: Colors.black,
              ),
              SalomonBottomBarItem(
                icon: Icon(Icons.favorite),
                title: Text("Favoritos"),
                selectedColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _goToPostNewAd() => BlocProvider.of<HomeBloc>(context).add(
        HomeNavigateToPostNewAdEvent(context: context),
      );

  _goToFilters() => BlocProvider.of<HomeBloc>(context).add(
        HomeNavigateToFiltersEvent(context: context),
      );

  _goToOptions() => BlocProvider.of<HomeBloc>(context).add(
        HomeNavigateToOptionsEvent(context: context),
      );

  _logout() => BlocProvider.of<HomeBloc>(context).add(
        HomeToLogoutEvent(context: context),
      );
}
