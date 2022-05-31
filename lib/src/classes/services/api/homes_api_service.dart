import 'package:casapp/src/classes/services/protocols/homes_service_protocol.dart';
import '../../models/home_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomesAPIService implements HomesServiceProtocol {
  @override
  Future<List<HomeModel>> getHomes() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("homes").get();

    List<HomeModel> list = snapshot.docs.map((element) {
      return HomeModel(
        id: element['id'],
        title: element['title'],
        description: element['description'],
        imageUrl: element['imageUrl'],
        price: element['price'],
        size: element['size'],
        location: element['location'],
        latitude: element['latitude'],
        longitude: element['longitude'],
        phone: element['phone'],
        isFavorite: element['isFavorite'],
        homeState: element['homeState'],
      );
    }).toList();

    return list;
  }

  @override
  Future<void> updateData(HomeModel homeModel) async {
    final docData = {
      'id': homeModel.id,
      'title': homeModel.title,
      'description': homeModel.description,
      'imageUrl': homeModel.imageUrl,
      'price': homeModel.price,
      'size': homeModel.size,
      'location': homeModel.location,
      'latitude': homeModel.latitude,
      'longitude': homeModel.longitude,
      'phone': homeModel.phone,
      'isFavorite': homeModel.isFavorite,
      'homeState': homeModel.homeState,
    };

    FirebaseFirestore.instance
        .collection("homes")
        .doc(homeModel.id)
        .set(docData, SetOptions(merge: true))
        .onError((e, _) => print("Error writing document: $e"));
  }

// @override
// List<HomeModel> getHomes() {
//   return [
//     HomeModel(
//       id: 'c1',
//       title: 'Casa en venta en San Bernardo',
//       description:
//           'Gran vivienda en venta en Avda Filiberto Villalobos, de 129 metros const. formado por 4 habitaciones, 2 baños, salón con salida a balcón, cocina con salida a balcón cerrado y trastero, piso muy luminoso, en avenida, fachada nueva, y excelente ubicación, a unos minutos de la plaza mayor y de las facultades, visítelo sin compromiso.',
//       homeStateFor: HomeStateFor.sell,
//       imageUrl:
//           'https://rapidapi.com/blog/wp-content/uploads/2018/10/architecture-1836070_640.jpg',
//       price: '199.999,99',
//       size: '129',
//       location: 'San Bernardo, Madrid',
//       latitude: 40.9693189,
//       longitude: -5.675506,
//       phone: '600 999 888',
//       affordability: Affordability.affordable,
//       isFavorite: true,
//     ),
//     HomeModel(
//       id: 'c2',
//       title: 'Alquiler de Piso en avenida Fernando Pessoa',
//       description:
//           'Piso a estrenar en el barrio de Huerta Otea de Salamanca, zona muy tranquila junto al Campus de la USAL y de la Facultad de Comunicación de la UPSA. Excepcionalmente luminoso, con vistas al Río Tormes. Calefacción por suelo radiante muy eficiente. Agua caliente sanitaria por paneles solares. Dispone de todos los electrodomésticos de clasificación energética A+++. Tendedero exterior.Buscamos empresas, estudiantes o profesores comprometidos y cuidadosos que quieran compartir un piso totalmente nuevo.',
//       homeStateFor: HomeStateFor.rent,
//       imageUrl:
//           'https://storage.googleapis.com/static.inmoweb.es/clients/258/property/550399/image/1377_11543430853.jpg?v=20181128185152540',
//       price: '800',
//       size: '104',
//       location: 'Salamanca, Madrid',
//       latitude: 40.9659889,
//       longitude: -5.686588,
//       phone: '655 900 122',
//       affordability: Affordability.affordable,
//       isFavorite: true,
//     ),
//     HomeModel(
//       id: 'c3',
//       title: 'Alquiler de Habitación en paseo de Canalejas',
//       description:
//           'Piso en el Paseo de Canalejas 67 - 6º B.A cinco minutos andando a la Plaza Mayor y a las Catedrales de Salamanca.Piso 130 m² reformado y decorado en 2017. Terraza en todo el perimetro de la casa. Aire acondicionado en toda la casa.Piso con Acceso a Internet WIFI130 m2',
//       homeStateFor: HomeStateFor.share,
//       imageUrl:
//           'https://erasmusflat.com/sc1/upload/habitaciones/WhatsAppImage2020-08-19at20.18.431.jpeg',
//       price: '400',
//       size: '130',
//       location: 'Delicias, Madrid',
//       latitude: 40.9641642,
//       longitude: -5.6601851,
//       phone: '644 765 321',
//       affordability: Affordability.affordable,
//       isFavorite: false,
//     ),
//     HomeModel(
//       id: 'c4',
//       title: 'Ático en venta en Alfonso IX De Leon',
//       description:
//           'Vivienda en última planta de edificio de nueva construcción.Amplísima cocina amueblada a estrenar con electrodomésticos. Salón comedor con grandes ventanales y salida a terraza con orientación sur.Baños completos, con sanitarios suspendidos en baño principal. Amplios muebles de lavabo.2 dormitorios con armarios empotrados vestidos.Dormitorio principal con vestidor y baño en suite y salida a otra amplia terraza.Toda la vivienda tiene una excelente orientación sur.La vivienda dispone de suelo radiante y suelo refrescante. Tiene aerotérmia y placas solares, por lo que el edificio es altamente eficiente.Posibilidad de plaza de garaje y trastero en el mismo edificio.Sin barreras arquitectónicas.Todo tipo de servicios a su alrededor y a escasos minutos andando de Corte Inglés.mejor ver.',
//       homeStateFor: HomeStateFor.sell,
//       imageUrl:
//           'https://dh2zqgwcmsl8h.cloudfront.net/eyJidWNrZXQiOiJyZXNlbS1lcyIsImtleSI6IjE1Mzk3NjIwMjkwNTVfMTg1MzE0NzAzMi5qcGciLCJlZGl0cyI6eyJyZXNpemUiOnsid2lkdGgiOjg0MCwiaGVpZ2h0Ijo2MzAsImZpdCI6ImNvdmVyIiwid2l0aG91dEVubGFyZ2VtZW50Ijp0cnVlfX19',
//       price: '390.500',
//       size: '120',
//       location: 'Garrido norte, Madrid',
//       latitude: 40.9743295,
//       longitude: -5.6573738,
//       phone: '621 987 235',
//       affordability: Affordability.pricey,
//       isFavorite: false,
//     ),
//     HomeModel(
//       id: 'c5',
//       title: 'Casa en venta en Almagro',
//       description:
//           'Espectacular y exclusivo piso a estrenar, reformado y amueblado con altísimas calidades junto a la Plaza de Colón. Ubicación privilegiada. Situado en edificio de fachada clásica con muy buenas zonas comunes, paso de carruajes, precioso ascensor de jaula, escalera patio.. . Servicio de portería.Impresionante altura de techos de más de 4 metros. Orientación Sur, muy luminoso.2ª planta con 306 m2 con 5 balcones a la calle distribuidos en: impresionante área social con impresionante hall de acceso, salón-comedor y espectacular cocina de diseño abierto y completamente equipada con electrodomésticos de alta gama. Aseo cortesía. Cuenta con 3 dormitorios con baños en suite, dos de ellos exteriores. Destaca el dormitorio principal, exterior, con baño en suite y espectacular vestidor.Zona de lavado y despensa, independiente vinculada a la zona de cocina. Plaza de garaje en finca incluida en precio. Reforma de lujo, altísimas calidades y mobiliario exclusivo.',
//       homeStateFor: HomeStateFor.sell,
//       imageUrl:
//           'https://d500.epimg.net/cincodias/imagenes/2020/11/05/economia/1604585899_865193_1604586041_noticia_normal.jpg',
//       price: '3.999.499',
//       size: '306',
//       location: 'Chamberí, Madrid',
//       latitude: 40.4340574,
//       longitude: -3.7111549,
//       phone: '677 577 333',
//       affordability: Affordability.luxurious,
//       isFavorite: false,
//     ),
//   ];
// }
}
