enum Affordability {
  affordable,
  pricey,
  luxurious,
}

enum State {
  sell,
  rent,
  share,
}

class Home {
  String id;
  String title;
  State? state;
  String imageUrl;
  double price;
  double size;
  String location;
  Affordability? affordability;

  Home({
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
