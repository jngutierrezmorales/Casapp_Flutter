import 'package:casapp/src/classes/modules/favorites/routing/favorites_routing.dart';
import 'package:casapp/src/classes/modules/favorites/bloc/favorites_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesPage extends StatefulWidget {
  static const favoritesPage = "favoritesPage";

  FavoritesRouting? favoritesRouting;

  FavoritesPage(this.favoritesRouting);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState(favoritesRouting);
}

class _FavoritesPageState extends State<FavoritesPage> {
  FavoritesRouting? favoritesRouting;

  _FavoritesPageState(this.favoritesRouting);

  late FavoritesBloc _favoritesBloc;

  @override
  void initState() {
    _favoritesBloc = BlocProvider.of<FavoritesBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favoritos'),
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
        body: BlocBuilder<FavoritesBloc, FavoritesState>(
            builder: (context, state) {
          return SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text("Casa1"),
                        ],
                      ),
                    ),
                  ),
                ),
                MyNavigationBar(),
              ],
            ),
          );
        }),
      ),
    );
  }

  _goToSearch() => BlocProvider.of<FavoritesBloc>(context).add(
        FavoritesNavigateToSearchEvent(context: context),
      );

  _goToFilters() => BlocProvider.of<FavoritesBloc>(context).add(
        FavoritesNavigateToFiltersEvent(context: context),
      );

  _goToOptions() => BlocProvider.of<FavoritesBloc>(context).add(
        FavoritesNavigateToOptionsEvent(context: context),
      );

  _logout() => BlocProvider.of<FavoritesBloc>(context).add(
        FavoritesToLogoutEvent(context: context),
      );
}

class MyNavigationBar extends StatefulWidget {
  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoritos',
        ),
      ],
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() => _currentIndex = index);
        _loadScreen();
      },
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
    );
  }

  void _loadScreen() {
    switch (_currentIndex) {
      case 0:
        return setState(() => _toHome());
    }
  }

  _toHome() {
    BlocProvider.of<FavoritesBloc>(context).add(
      FavoritesNavigateToHomeEvent(context: context),
    );
  }
}
