class ProductsModel {
  late String type;
  late String message;
  late List<Data> data;

  ProductsModel(
      {required this.type, required this.message, required this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  late String productId;
  late String name;
  late String description;
  late String imageUrl;
  late String type;
  late int price;
  late int quantity;
  late bool available;
  late Seed seed;
  late Plant plant;
  late Tool tool;

  Data(
      {required this.productId,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.type,
      required this.price,
      required this.quantity,
      required this.available,
      required this.seed,
      required this.plant,
      required this.tool});

  Data.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    quantity = 0;
    available = json['available'];
    seed = json['seed'] != null
        ? Seed.fromJson(json['seed'])
        : Seed(seedId: '', name: '', description: '', imageUrl: '');
    plant = json['plant'] != null
        ? Plant.fromJson(json['plant'])
        : Plant(
            plantId: '',
            name: '',
            description: '',
            imageUrl: '',
            waterCapacity: 0,
            sunLight: 0,
            temperature: 0);
    tool = json['tool'] != null
        ? Tool.fromJson(json['tool'])
        : Tool(toolId: '', name: '', description: '', imageUrl: '');
  }
}

class Seed {
  late String seedId;
  late String name;
  late String description;
  late String imageUrl;

  Seed(
      {required this.seedId,
      required this.name,
      required this.description,
      required this.imageUrl});

  Seed.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seedId'] = seedId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

class Plant {
  late String plantId;
  late String name;
  late String description;
  late String imageUrl;
  late int waterCapacity;
  late int sunLight;
  late int temperature;

  Plant(
      {required this.plantId,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.waterCapacity,
      required this.sunLight,
      required this.temperature});

  Plant.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plantId'] = plantId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['waterCapacity'] = waterCapacity;
    data['sunLight'] = sunLight;
    data['temperature'] = temperature;
    return data;
  }
}

class Tool {
  late String toolId;
  late String name;
  late String description;
  late String imageUrl;

  Tool(
      {required this.toolId,
      required this.name,
      required this.description,
      required this.imageUrl});

  Tool.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['toolId'] = toolId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
