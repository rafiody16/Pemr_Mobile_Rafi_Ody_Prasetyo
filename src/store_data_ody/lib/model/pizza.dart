class Pizza {
  static const String keyId = 'id';
  static const String keyName = 'pizzaName';
  static const String keyDescription = 'description';
  static const String keyPrice = 'price';
  static const String keyImage = 'imageUrl';

  int id = 0;
  String pizzaName = '';
  String description = '';
  double price = 0.0;
  String imageUrl = '';

  Pizza();

  Pizza.fromJson(Map<String, dynamic> json) {
    id = int.tryParse(json[keyId].toString()) ?? 0;
    pizzaName = json[keyName]?.toString() ?? 'No name';
    description = json[keyDescription]?.toString() ?? '';
    price = double.tryParse(json[keyPrice].toString()) ?? 0.0;
    imageUrl = json[keyImage]?.toString() ?? '';
  }

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
