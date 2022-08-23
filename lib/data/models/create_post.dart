class CreatePost {
  late String type;
  late String message;
  late Data data;

  CreatePost({required this.type, required this.message, required this.data});

  CreatePost.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    message = json['message'];
    data = json['data'] != null
        ? Data.fromJson(json['data'])
        : Data(
            forumId: '', title: '', description: '', imageUrl: '', userId: '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['message'] = message;
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  late String forumId;
  late String title;
  late String description;
  late String imageUrl;
  late String userId;

  Data(
      {required this.forumId,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.userId});

  Data.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['forumId'] = forumId;
    data['title'] = title;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['userId'] = userId;
    return data;
  }
}
