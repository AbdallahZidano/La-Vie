class UserDataModel {
  late String _type;
  late String _message;
  late Data _data;

  UserDataModel(
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

  UserDataModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null
        ? Data.fromJson(json['data'])
        : Data(
            userId: '',
            firstName: '',
            lastName: '',
            email: '',
            imageUrl: '',
            address: '',
            userPoints: '',
            userNotification: []);
  }
}

class Data {
  late String _userId;
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _imageUrl;
  late String _address;
  late String _userPoints;
  late List<String> _userNotification;

  Data(
      {required String userId,
      required String firstName,
      required String lastName,
      required String email,
      required String imageUrl,
      required String address,
      required String userPoints,
      required List<String> userNotification}) {
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _imageUrl = imageUrl;
    _address = address;
    _userPoints = userPoints;
    _userNotification = userNotification;
  }

  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get firstName => _firstName;
  set firstName(String firstName) => _firstName = firstName;
  String get lastName => _lastName;
  set lastName(String lastName) => _lastName = lastName;
  String get email => _email;
  set email(String email) => _email = email;
  String get imageUrl => _imageUrl;
  set imageUrl(String imageUrl) => _imageUrl = imageUrl;
  String get address => _address;
  set address(String address) => _address = address;
  String get userPoints => _userPoints;
  set userPoints(String userPoints) => _userPoints = userPoints;
  List<String> get userNotification => _userNotification;
  set userNotification(List<String> userNotification) =>
      _userNotification = userNotification;

  Data.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _address = json['address'] ?? "";
    _userPoints = json['UserPoints'] ?? "0";
    _userNotification = json['UserNotification'].cast<String>();
  }
}
