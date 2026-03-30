import 'package:get/get.dart';

class HomeController extends GetxController {
  final categories = [
    {"name": "Wedding", "icon": "💍"},
    {"name": "Festivals", "icon": "🎆"},
    {"name": "Cooking", "icon": "🍳"},
    {"name": "Decoration", "icon": "🎨"},
    {"name": "Music", "icon": "🎸"},
  ].obs;

  final featuredServices = [
    {
      "title": "Traditional Catering",
      "provider": "Royal Kitchen",
      "rating": 4.8,
      "price": 250,
      "image": "https://images.unsplash.com/photo-1555507036-ab1f4038808a",
    },
    {
      "title": "Floral Decoration",
      "provider": "Bloom Designers",
      "rating": 4.9,
      "price": 400,
      "image": "https://images.unsplash.com/photo-1519225421980-715cb0215aed",
    },
    {
      "title": "Live Folk Music",
      "provider": "Musical Roots",
      "rating": 4.7,
      "price": 180,
      "image": "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4",
    },
  ].obs;
}
