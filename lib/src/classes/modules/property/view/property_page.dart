import 'package:casapp/src/classes/modules/property/bloc/property_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyPage extends StatefulWidget {
  static const propertyPage = "propertyPage";

  @override
  State<PropertyPage> createState() => _PropertyPageState();
}

class _PropertyPageState extends State<PropertyPage> {
  late PropertyBloc _propertyBloc;

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
