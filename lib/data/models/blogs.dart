class BlogsModel {
  late String _type;
  late String _message;
  late Data _data;

  BlogsModel(
      {required String type, required String message, required Data data}) {
    _type = type;
    _message = message;
    _data = data;
  }

  String get type => _type;
  set type(String type) => _type = type;
  String get message => _message;
  set message(String message) => _message = message;
  Data get data => _data;
  set data(Data data) => _data = data;

  BlogsModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null
        ? Data.fromJson(json['data'])
        : Data(plants: [
            Plants(
                plantId: '',
                name: '',
                description: '',
                imageUrl: '',
                waterCapacity: 0,
                sunLight: 0,
                temperature: 0)
          ], seeds: [
            Seeds(seedId: '', name: '', description: '', imageUrl: '')
          ], tools: [
            Tools(toolId: '', name: '', description: '', imageUrl: '')
          ]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['message'] = _message;
    if (_data != null) {
      data['data'] = _data.toJson();
    }
    return data;
  }
}

class Data {
  late List<Plants> _plants;
  late List<Seeds> _seeds;
  late List<Tools> _tools;

  Data(
      {required List<Plants> plants,
      required List<Seeds> seeds,
      required List<Tools> tools}) {
    _plants = plants;
    _seeds = seeds;
    _tools = tools;
  }

  List<Plants> get plants => _plants;
  set plants(List<Plants> plants) => _plants = plants;
  List<Seeds> get seeds => _seeds;
  set seeds(List<Seeds> seeds) => _seeds = seeds;
  List<Tools> get tools => _tools;
  set tools(List<Tools> tools) => _tools = tools;

  Data.fromJson(Map<String, dynamic> json) {
    if (json['plants'] != null) {
      _plants = <Plants>[];
      json['plants'].forEach((v) {
        _plants.add(Plants.fromJson(v));
      });
    }
    if (json['seeds'] != null) {
      _seeds = <Seeds>[];
      json['seeds'].forEach((v) {
        _seeds.add(Seeds.fromJson(v));
      });
    }
    if (json['tools'] != null) {
      _tools = <Tools>[];
      json['tools'].forEach((v) {
        _tools.add(Tools.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_plants != null) {
      data['plants'] = _plants.map((v) => v.toJson()).toList();
    }
    if (_seeds != null) {
      data['seeds'] = _seeds.map((v) => v.toJson()).toList();
    }
    if (_tools != null) {
      data['tools'] = _tools.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Plants {
  late String _plantId;
  late String _name;
  late String _description;
  late String _imageUrl;
  late int _waterCapacity;
  late int _sunLight;
  late int _temperature;

  Plants(
      {required String plantId,
      required String name,
      required String description,
      required String imageUrl,
      required int waterCapacity,
      required int sunLight,
      required int temperature}) {
    _plantId = plantId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
    _waterCapacity = waterCapacity;
    _sunLight = sunLight;
    _temperature = temperature;
  }

  String get plantId => _plantId;
  set plantId(String plantId) => _plantId = plantId;
  String get name => _name;
  set name(String name) => _name = name;
  String get description => _description;
  set description(String description) => _description = description;
  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;
  int get waterCapacity => _waterCapacity;
  set waterCapacity(int waterCapacity) => _waterCapacity = waterCapacity;
  int get sunLight => _sunLight;
  set sunLight(int sunLight) => _sunLight = sunLight;
  int get temperature => _temperature;
  set temperature(int temperature) => _temperature = temperature;

  Plants.fromJson(Map<String, dynamic> json) {
    _plantId = json['plantId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
    _waterCapacity = json['waterCapacity'];
    _sunLight = json['sunLight'];
    _temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['plantId'] = _plantId;
    data['name'] = _name;
    data['description'] = _description;
    data['imageUrl'] = _imageUrl;
    data['waterCapacity'] = _waterCapacity;
    data['sunLight'] = _sunLight;
    data['temperature'] = _temperature;
    return data;
  }
}

class Seeds {
  late String _seedId;
  late String _name;
  late String _description;
  late String _imageUrl;

  Seeds(
      {required String seedId,
      required String name,
      required String description,
      required String imageUrl}) {
    _seedId = seedId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
  }

  String get seedId => _seedId;
  set seedId(String seedId) => _seedId = seedId;
  String get name => _name;
  set name(String name) => _name = name;
  String get description => _description;
  set description(String description) => _description = description;
  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;

  Seeds.fromJson(Map<String, dynamic> json) {
    _seedId = json['seedId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['seedId'] = _seedId;
    data['name'] = _name;
    data['description'] = _description;
    data['imageUrl'] = _imageUrl;
    return data;
  }
}

class Tools {
  late String _toolId;
  late String _name;
  late String _description;
  late String _imageUrl;

  Tools(
      {required String toolId,
      required String name,
      required String description,
      required String imageUrl}) {
    _toolId = toolId;
    _name = name;
    _description = description;
    _imageUrl = imageUrl;
  }

  String get toolId => _toolId;
  set toolId(String toolId) => _toolId = toolId;
  String get name => _name;
  set name(String name) => _name = name;
  String get description => _description;
  set description(String description) => _description = description;
  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;

  Tools.fromJson(Map<String, dynamic> json) {
    _toolId = json['toolId'];
    _name = json['name'];
    _description = json['description'];
    _imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['toolId'] = _toolId;
    data['name'] = _name;
    data['description'] = _description;
    data['imageUrl'] = _imageUrl;
    return data;
  }
}
