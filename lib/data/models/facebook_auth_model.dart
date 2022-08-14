class FacebookAuthModel {
  late String _name;
  late Picture _picture;
  late String _id;

  FacebookAuthModel(
      {required String name, required Picture picture, required String id}) {
    _name = name;
    _picture = picture;
    _id = id;
  }

  String get name => _name;
  set name(String name) => _name = name;
  Picture get picture => _picture;
  set picture(Picture picture) => _picture = picture;
  String get id => _id;
  set id(String id) => _id = id;

  FacebookAuthModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _picture = json['picture'] != null
        ? Picture.fromJson(json['picture'])
        : Picture(
            data: Data(height: 0, isSilhouette: false, url: '', width: 0));
    _id = json['id'];
  }
}

class Picture {
  late Data _data;

  Picture({required Data data}) {
    _data = data;
  }

  Data get data => _data;
  set data(Data data) => _data = data;

  Picture.fromJson(Map<String, dynamic> json) {
    _data = json['data'] != null
        ? Data.fromJson(json['data'])
        : Data(height: 0, isSilhouette: false, url: '', width: 0);
  }
}

class Data {
  late int _height;
  late bool _isSilhouette;
  late String _url;
  late int _width;

  Data(
      {required int height,
      required bool isSilhouette,
      required String url,
      required int width}) {
    _height = height;
    _isSilhouette = isSilhouette;
    _url = url;
    _width = width;
  }

  int get height => _height;
  set height(int height) => _height = height;
  bool get isSilhouette => _isSilhouette;
  set isSilhouette(bool isSilhouette) => _isSilhouette = isSilhouette;
  String get url => _url;
  set url(String url) => _url = url;
  int get width => _width;
  set width(int width) => _width = width;

  Data.fromJson(Map<String, dynamic> json) {
    _height = json['height'];
    _isSilhouette = json['is_silhouette'];
    _url = json['url'];
    _width = json['width'];
  }
}
