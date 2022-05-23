enum Affordability {
  affordable,
  pricey,
  luxurious,
  undefined,
}

enum HomeStateFor {
  sell,
  rent,
  share,
  undefined,
}

extension HomeState on HomeStateFor {
  String get name {
    switch (this) {
      case HomeStateFor.share:
        return 'COMPARTIR';
      case HomeStateFor.rent:
        return 'ALQUILAR';
      case HomeStateFor.sell:
        return 'VENTA';
      case HomeStateFor.undefined:
        return 'INDEFINIDO';
    }
  }
}

class HomeModel {
  final String id;
  final String title;
  final String description;
  final HomeStateFor homeStateFor;
  final String imageUrl;
  final String price;
  final String size;
  final String location;
  final double latitude;
  final double longitude;
  final String phone;
  final Affordability affordability;

  HomeModel({
    this.id = '',
    this.title = '',
    this.description = '',
    this.homeStateFor = HomeStateFor.undefined,
    this.imageUrl = '',
    this.price = '',
    this.size = '',
    this.location = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
    this.phone = '',
    this.affordability = Affordability.undefined,
  });
}

List<HomeModel> dummyHomes = [
  HomeModel(
    id: 'c1',
    title: 'Venta de Casa en plaza de Ortega y Gasset',
    homeStateFor: HomeStateFor.sell,
    imageUrl:
        'https://rapidapi.com/blog/wp-content/uploads/2018/10/architecture-1836070_640.jpg',
    price: '199.999,99',
    size: '145',
    location: 'Madrid',
    affordability: Affordability.affordable,
  ),
  HomeModel(
    id: 'c2',
    title: 'Casa2',
    homeStateFor: HomeStateFor.rent,
    imageUrl:
        'https://storage.googleapis.com/static.inmoweb.es/clients/258/property/550399/image/1377_11543430853.jpg?v=20181128185152540',
    price: '700',
    size: '70',
    location: 'Madrid',
    affordability: Affordability.affordable,
  ),
  HomeModel(
    id: 'c3',
    title: 'Casa3',
    homeStateFor: HomeStateFor.share,
    imageUrl:
        'https://erasmusflat.com/sc1/upload/habitaciones/WhatsAppImage2020-08-19at20.18.431.jpeg',
    price: '400',
    size: '30',
    location: 'Barcelona',
    affordability: Affordability.affordable,
  ),
  HomeModel(
    id: 'c4',
    title: 'Casa4',
    homeStateFor: HomeStateFor.sell,
    imageUrl:
        'https://cf.bstatic.com/xdata/images/hotel/max1024x768/318403857.jpg?k=10be793280e66d8445921f86c42eb80c485670e6f837f48b3567318c7d58d4c0&o=&hp=1',
    price: '780.500',
    size: '450',
    location: 'Malaga',
    affordability: Affordability.pricey,
  ),
  HomeModel(
    id: 'c5',
    title: 'Casa5',
    homeStateFor: HomeStateFor.sell,
    imageUrl:
        'https://d500.epimg.net/cincodias/imagenes/2020/11/05/economia/1604585899_865193_1604586041_noticia_normal.jpg',
    price: '1.850.499',
    size: '650',
    location: 'Madrid',
    affordability: Affordability.luxurious,
  ),
];
