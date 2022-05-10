import 'package:casapp/src/classes/modules/home/bloc/home_bloc.dart';
import 'package:casapp/src/classes/providers/routing/routing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  static const homePage = "homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  int _selectedTab = 0;

  List<Widget> _widgets = [];

  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _loadViews();
    super.initState();
  }

  void _loadViews() {
    _widgets = [
      RoutingProvider().propertyRouting(),
      RoutingProvider().favoritesRouting(),
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
          title: const Text('Menu'),
          //automaticallyImplyLeading: false,
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 180,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                color: Colors.blue,
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset('assets/imgs/drawer_logo.png'),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                title: const Text("Buscar"),
                leading: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
                onTap: _goToSearch,
              ),
              const Divider(
                color: Colors.grey,
              ),
              ListTile(
                title: const Text("Filtros"),
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
                title: const Text("Opciones"),
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
                title: const Text("Salir"),
                leading: IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () {},
                ),
                onTap: _logout,
              ),
              const Divider(
                color: Colors.grey,
              ),
            ],
          ),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _widgets.elementAt(_selectedTab),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: SalomonBottomBar(
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
    );
  }

  _goToSearch() => BlocProvider.of<HomeBloc>(context).add(
        HomeNavigateToSearchEvent(context: context),
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
