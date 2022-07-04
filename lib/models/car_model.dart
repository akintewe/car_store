class CarModel {
  String carPicture;
  String categoryName;
  String carQuantity;
  String carColor;

  CarModel(
      {required this.carPicture,
      required this.categoryName,
      required this.carQuantity,
      required this.carColor});

  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
      carPicture: json['carPicture'],
      categoryName: json['categoryName'],
      carQuantity: json['carQuantity'],
      carColor: json['carColor']);

  Map<String, dynamic> toJson() => {
        "carPicture": carPicture,
        "categoryName": categoryName,
        "carQuantity": carQuantity,
        "carColor": carColor,
      };
}
