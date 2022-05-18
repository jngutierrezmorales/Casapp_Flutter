import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../models/home_model.dart';

class PropertyDetailPage extends StatefulWidget {
  static const detailPage = "detailPage";

  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {

  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(40.390768, -3.5863844),
    zoom: 12.0,
  );
  final Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Venta de Casa en plaza de Ortega y Gasset'),
      ),
      body: Column(
        children: [
          Expanded(
            //height: MediaQuery.of(context).size.height * 0.5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                    'https://rapidapi.com/blog/wp-content/uploads/2018/10/architecture-1836070_640.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 10),
                    child: const Text(
                      'Habitacion doble con armario empotradoen piso compartido, Calefacción central y agua incluidos en el precio, solo gastos de luz, tendedero, cerca de parada de autobús, 286, 287,288, 203 y nocturno.',
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Coslada, Madrid',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.euro,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '600 €/mes',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 20, bottom: 30),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '600 999 888',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 20, bottom: 30),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '600 999 888',
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 20, bottom: 30),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '600 999 888',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.amber,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition,
              myLocationEnabled: false,
            ),
          ),
        ],
      ),
    );
  }
}
