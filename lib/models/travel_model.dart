class TravelModel {
  
  String? name;
  String? location;
  String? distance;
  String? temp;
  String? rating;
  String? description;
  int? price;
  String? image;

  TravelModel(
    {
      required this.name,
      required this.location,
      required this.distance,
      required this.temp,
      required this.rating,
      required this.description,
      required this.price,
      required this.image,
    }
  );
}

List<TravelModel> travelList = [

  TravelModel(
    name: 'Newyork',
    location: 'USA, Newyork City',
    distance: '10KM',
    temp: '28℃',
    rating: '4.8',
    description: 'adwadwawdadawdadadawdawdawddddddddddddddadadawdsdcxzcsfwdqd',
    price: 1270,
    image: 'assets/image/newyork.png'
  ),

  TravelModel(
    name: 'Rome',
    location: 'Italy, Rome',
    distance: '15KM',
    temp: '33℃',
    rating: '4.1',
    description: 'adwadwawdadawdadadawdawdawddddddddddddddadadawdsdcxzcsfwdqd',
    price: 970,
    image: 'assets/image/rome.png'
  ),

  TravelModel(
    name: 'Rasht',
    location: 'Islamic Republic of Iran, Rasht',
    distance: '2KM',
    temp: '18℃',
    rating: '4.3',
    description: 'adwadwawdadawdadadawdawdawddddddddddddddadadawdsdcxzcsfwdqd',
    price: 599,
    image: 'assets/image/rasht.png'
  ),

  TravelModel(
    name: 'Istanbul',
    location: 'Turkey, Istanbul',
    distance: '50KM',
    temp: '31℃',
    rating: '4.4',
    description: 'adwadwawdadawdadadawdawdawddddddddddddddadadawdsdcxzcsfwdqd',
    price: 1010,
    image: 'assets/image/istanbul.png'
  ),

  TravelModel(
    name: 'Dubai',
    location: 'UAE, Dubai',
    distance: '220KM',
    temp: '40℃',
    rating: '4.9',
    description: 'adwadwawdadawdadadawdawdawddddddddddddddadadawdsdcxzcsfwdqd',
    price: 850,
    image: 'assets/image/dubai.png'
  ),

];