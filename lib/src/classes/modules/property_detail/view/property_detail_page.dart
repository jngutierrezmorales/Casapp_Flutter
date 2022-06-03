import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../models/home_model.dart';
import '../bloc/property_detail_bloc.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class PropertyDetailPage extends StatefulWidget {
  static const detailPage = "detailPage";

  HomeModel homeModel;

  PropertyDetailPage(this.homeModel);

  @override
  State<PropertyDetailPage> createState() => _PropertyDetailPageState();
}

class _PropertyDetailPageState extends State<PropertyDetailPage> {
  late PropertyDetailBloc _propertyDetailBloc;
  HomeModel homeModel = HomeModel();
  late double latitude = 40.390768;
  late double longitude = -3.5863844;
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = <Marker>{};
  bool isFavorite = false;

  CameraPosition _initialPosition(double latitude, double longitude) {
    return CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 16.0,
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
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

  _phoneCall() async {
    var url = 'tel:' + widget.homeModel.phone;
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  final Email email = Email(
    body:
        'Hola, me interesa esta casa y me gustaría hacer una visita. Un saludo.',
    subject: 'Casapp',
    recipients: ['test@casapp.com'],
    isHTML: false,
  );

  _sendEmail() async {
    await FlutterEmailSender.send(email);
  }

  Icon toogleFavorite() {
    return const Icon(
      Icons.favorite,
      color: Colors.white,
    );
  }

  @override
  void initState() {
    _propertyDetailBloc = BlocProvider.of<PropertyDetailBloc>(context);
    //_propertyDetailBloc.add(GetHomeDataEvent(context: context));
    _propertyDetailBloc
        .add(UploadDataEvent(context: context, homeModel: widget.homeModel));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Volver',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.57,
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
                        child: FloatingActionButton(
                          mini: true,
                          backgroundColor: Colors.black,
                          onPressed: () {
                            setState(() {
                              if (widget.homeModel.isFavorite == true) {
                                isFavorite = true;
                                widget.homeModel.isFavorite = false;
                              } else {
                                isFavorite = false;
                                widget.homeModel.isFavorite = true;
                              }
                            });
                            _updateData();
                            //HomesAPIService().updateData(widget.homeModel);
                          },
                          child: Icon(
                            widget.homeModel.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 15, right: 20, left: 20, bottom: 30),
                    child: Text(
                      widget.homeModel.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: const EdgeInsets.only(left: 20, bottom: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.weekend,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.homeModel.homeState,
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        const Icon(
                          Icons.euro,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.homeModel.price,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin:
                        const EdgeInsets.only(top: 10, left: 20, bottom: 30),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.homeModel.size + ' metros',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        const Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          widget.homeModel.location,
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20, bottom: 15),
                    child: const Text(
                      'Contactar por teléfono',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                    const EdgeInsets.only(right: 19, left: 19, bottom: 20),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      onPressed: _phoneCall,
                      icon: const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      label: Text(
                        widget.homeModel.phone,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Contactar por email',
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
                        const EdgeInsets.only(right: 19, left: 19, bottom: 55),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text(
                        'Enviar mensaje',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      onPressed: _sendEmail,
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

  _getHomes() {
    BlocProvider.of<PropertyDetailBloc>(context).add(
      GetHomeDataEvent(context: context),
    );
  }

  _updateData() {
    BlocProvider.of<PropertyDetailBloc>(context).add(
      UploadDataEvent(context: context, homeModel: widget.homeModel),
    );
  }
}
