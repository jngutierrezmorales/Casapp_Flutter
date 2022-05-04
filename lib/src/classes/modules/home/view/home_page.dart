import 'package:casapp/src/classes/managers/route_manager.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const homePage = "homePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Casapp'),
        //automaticallyImplyLeading: false,
      ),
      drawer: MenuDrawer(),
      body: SafeArea(
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
      ),
    );
  }
}

class BarBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.yellow,
      items: const [
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

class MenuDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
          buildListTile('Buscar', Icons.search, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Opciones', Icons.menu, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Salir', Icons.logout, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
        ],
      ),
    );
  }
}
