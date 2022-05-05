import 'package:casapp/src/classes/modules/filters/bloc/filters_bloc.dart';
import 'package:casapp/src/classes/modules/home/bloc/home_bloc.dart';
import 'package:casapp/src/classes/modules/home/routing/home_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const homePage = "homePage";

  HomeRouting? homeRouting;

  HomePage(this.homeRouting);

  @override
  State<HomePage> createState() => _HomePageState(homeRouting);
}

class _HomePageState extends State<HomePage> {
  HomeRouting? homeRouting;

  _HomePageState(this.homeRouting);

  late HomeBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = BlocProvider.of<HomeBloc>(context);
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
          title: const Text('Casapp'),
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
                      width: double.infinity,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CardHome(),
                            CardHome(),
                            CardHome(),
                            CardHome(),
                            CardHome(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BarBottom(),
                ],
              ),
            );
          },
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

class BarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.yellow,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Viviendas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favoritos',
        ),
      ],
    );
  }
}

class CardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  "https://rapidapi.com/blog/wp-content/uploads/2018/10/architecture-1836070_640.jpg",
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 10,
                child: Container(
                  width: 100,
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 20,
                  ),
                  child: const Text("VENTA"),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: const <Widget>[
                    Icon(
                      Icons.room,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text('Madrid'),
                  ],
                ),
                Row(
                  children: const <Widget>[
                    Icon(
                      Icons.home,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("150m"),
                  ],
                ),
                Row(
                  children: const <Widget>[
                    Icon(
                      Icons.euro,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text("150.000"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
