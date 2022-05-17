enum Affordability {
  affordable,
  pricey,
  luxurious,
}

enum HomeState {
  sell,
  rent,
  share,
}

class HomeModel {
  final String id;
  final String title;
  final HomeState? state;
  final String imageUrl;
  final double price;
  final double size;
  final String location;
  final Affordability? affordability;

  HomeModel({
    this.id = '',
    this.title = '',
    this.state,
    this.imageUrl = '',
    this.price = 0.0,
    this.size = 0.0,
    this.location = '',
    this.affordability,
  });
}

final dummyHomes = [
  HomeModel(
    id: 'c1',
    title: 'Casa1',
    state: HomeState.sell,
    imageUrl: 'https://rapidapi.com/blog/wp-content/uploads/2018/10/architecture-1836070_640.jpg',
    price: 199999.99,
    size: 145,
    location: 'Madrid',
    affordability: Affordability.affordable,
  ),
  HomeModel(
    id: 'c2',
    title: 'Casa2',
    state: HomeState.rent,
    imageUrl: 'https://storage.googleapis.com/static.inmoweb.es/clients/258/property/550399/image/1377_11543430853.jpg?v=20181128185152540',
    price: 700,
    size: 70,
    location: 'Madrid',
    affordability: Affordability.affordable,
  ),
  HomeModel(
    id: 'c3',
    title: 'Casa3',
    state: HomeState.share,
    imageUrl: 'https://erasmusflat.com/sc1/upload/habitaciones/WhatsAppImage2020-08-19at20.18.431.jpeg',
    price: 400,
    size: 30,
    location: 'Barcelona',
    affordability: Affordability.affordable,
  ),
  HomeModel(
    id: 'c4',
    title: 'Casa4',
    state: HomeState.sell,
    imageUrl: 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/318403857.jpg?k=10be793280e66d8445921f86c42eb80c485670e6f837f48b3567318c7d58d4c0&o=&hp=1',
    price: 780500,
    size: 450,
    location: 'Malaga',
    affordability: Affordability.pricey,
  ),
  HomeModel(
    id: 'c5',
    title: 'Casa5',
    state: HomeState.sell,
    imageUrl: 'https://www.promora.com/blog/wp-content/uploads/2018/10/Fotos_de_chalets_modernos-754x503.jpg',
    price: 1850499,
    size: 650,
    location: 'Madrid',
    affordability: Affordability.luxurious,
  ),
];
