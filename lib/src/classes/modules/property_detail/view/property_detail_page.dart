import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../models/home_model.dart';
import '../bloc/property_detail_bloc.dart';

class PropertyDetailPage extends StatefulWidget {
  static const detailPage = "detailPage";

  HomeModel homeModel;

  PropertyDetailPage(this.homeModel);

  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  late PropertyDetailBloc _propertyDetailBloc;
  late double latitude = 40.390768;
  late double longitude = -3.5863844;
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = <Marker>{};

  CameraPosition _initialPosition(double latitude, double longitude) {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 16.0,
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  void initState() {
    _propertyDetailBloc = BlocProvider.of<PropertyDetailBloc>(context);
    //_setMarker(LatLng(latitude, longitude));
    super.initState();
  }

  void _setMarker(double latitude, double longitude) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('marker'),
          position: LatLng(latitude, longitude),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Volver'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(color: Colors.white),
                        alignment: Alignment.center,
                        height: 200,
                        child: Image.network(
                          widget.homeModel.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.black,
                            ),
                          ),
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 20, right: 20, left: 20, bottom: 10),
                    child: Text(
                      widget.homeModel.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(top: 20, left: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.homeModel.size + ' metros',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.homeModel.location,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.euro,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.homeModel.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Icon(
                          Icons.phone,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          widget.homeModel.phone,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      'Descripción de la vivienda',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                        top: 15, left: 20, right: 20, bottom: 10),
                    child: Text(
                      widget.homeModel.description,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Pregunta al anunciante',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 5, left: 5),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: TextField(
                        style: TextStyle(
                          height: 1,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Escribe aquí...',
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(right: 19, left: 19, bottom: 30),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Enviar mensaje',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: MediaQuery.of(context).size.height * 0.3,
            color: Colors.amber,
            child: GoogleMap(
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              initialCameraPosition: _initialPosition(
                  widget.homeModel.latitude, widget.homeModel.longitude),
              markers: {
                Marker(
                  icon: BitmapDescriptor.defaultMarker,
                  markerId: const MarkerId('marker'),
                  position: LatLng(
                      widget.homeModel.latitude, widget.homeModel.longitude),
                ),
              },
              myLocationEnabled: false,
              zoomControlsEnabled: false,
            ),
          ),
        ],
      ),
    );
  }
}
