class LoginModel {
  late String _type;
  late String _message;
  late Data _data;

  LoginModel(
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

  LoginModel.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _message = json['message'];
    _data = json['data'] != null
        ? Data.fromJson(json['data'])
        : Data(
            user: User(
                userId: '',
                firstName: '',
                lastName: '',
                email: '',
                imageUrl: '',
                address: '',
                role: ''),
            accessToken: '',
            refreshToken: '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['message'] = _message;
    data['data'] = _data.toJson();
    return data;
  }
}

class Data {
  late User _user;
  late String _accessToken;
  late String _refreshToken;

  Data(
      {required User user,
      required String accessToken,
      required String refreshToken}) {
    _user = user;
    _accessToken = accessToken;
    _refreshToken = refreshToken;
  }

  User get user => _user;
  set user(User user) => _user = user;
  String get accessToken => _accessToken;
  set accessToken(String accessToken) => _accessToken = accessToken;
  String get refreshToken => _refreshToken;
  set refreshToken(String refreshToken) => _refreshToken = refreshToken;

  Data.fromJson(Map<String, dynamic> json) {
    _user = json['user'] != null
        ? User.fromJson(json['user'])
        : User(
            userId: '',
            firstName: '',
            lastName: '',
            email: '',
            imageUrl: '',
            address: '',
            role: '');
    _accessToken = json['accessToken'];
    _refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = _user.toJson();
    data['accessToken'] = _accessToken;
    data['refreshToken'] = _refreshToken;
    return data;
  }
}

class User {
  late String _userId;
  late String _firstName;
  late String _lastName;
  late String _email;
  late String _imageUrl;
  late String _address;
  late String _role;

  User(
      {required String userId,
      required String firstName,
      required String lastName,
      required String email,
      required String imageUrl,
      required String address,
      required String role}) {
    _userId = userId;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _imageUrl = imageUrl;
    _address = address;
    _role = role;
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
  String get role => _role;
  set role(String role) => _role = role;

  User.fromJson(Map<String, dynamic> json) {
    _userId = json['userId'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _imageUrl = json['imageUrl'];
    _address = json['address'] ?? '';
    _role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = _userId;
    data['firstName'] = _firstName;
    data['lastName'] = _lastName;
    data['email'] = _email;
    data['imageUrl'] = _imageUrl;
    data['address'] = _address;
    data['role'] = _role;
    return data;
  }
}
