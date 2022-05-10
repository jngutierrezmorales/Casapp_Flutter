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
  final String id;
  final String title;
  final State? state;
  final String imageUrl;
  final double price;
  final double size;
  final String location;
  final Affordability? affordability;

  const Home({
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
