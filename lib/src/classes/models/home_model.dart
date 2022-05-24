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
