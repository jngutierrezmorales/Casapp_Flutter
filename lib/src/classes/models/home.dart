import 'package:flutter/foundation.dart';

enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class Home {
  final String id;
  final String title;
  final String state;
  final String imageUrl;
  final double price;
  final int size;
  final String location;
  final Affordability affordability;

  const Home({
    required this.id,
    required this.title,
    required this.state,
    required this.imageUrl,
    required this.price,
    required this.size,
    required this.location,
    required this.affordability,
  });
}
