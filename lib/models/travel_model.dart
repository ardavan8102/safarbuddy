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