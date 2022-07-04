class SavedCarModel {
  String img;
  String year;
  String name;
  String speed;
  String color;
  String price;
  String location;

  SavedCarModel(
      {required this.img,
      required this.year,
      required this.name,
      required this.speed,
      required this.color,
      required this.price,
      required this.location});

  factory SavedCarModel.fromJson(Map<String, dynamic> json) => SavedCarModel(
      img: json['img'],
      year: json['year'],
      name: json['name'],
      speed: json['speed'],
      color: json['color'],
      price: json['price'],
      location: json['location']);

  Map<String, dynamic> toJson() => {
        "img": img,
        "year": year,
        "name": name,
        "speed": speed,
        "color": color,
        "price": price,
        "location": location
      };
}
