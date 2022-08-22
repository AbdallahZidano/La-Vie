class ForumsModel {
  late String type;
  late String message;
  late List<Data> data;

  ForumsModel({required this.type, required this.message, required this.data});

  ForumsModel.fromJson(Map<String, dynamic> json) {
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
  late String forumId;
  late String title;
  late String description;
  late String imageUrl;
  late String userId;
  late List<ForumLikes> forumLikes;
  late List<ForumComments> forumComments;

  Data(
      {required this.forumId,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.userId,
      required this.forumLikes,
      required this.forumComments});

  Data.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
    imageUrl =
        json['imageUrl'] ?? "/uploads/04edd753-8fd8-4baa-bbe0-4853282b1fd1.jpg";
    userId = json['userId'];
    if (json['ForumLikes'] != null) {
      forumLikes = <ForumLikes>[];
      json['ForumLikes'].forEach((v) {
        forumLikes.add(ForumLikes.fromJson(v));
      });
    }
    if (json['ForumComments'] != null) {
      forumComments = <ForumComments>[];
      json['ForumComments'].forEach((v) {
        forumComments.add(ForumComments.fromJson(v));
      });
    }
  }
}

class ForumLikes {
  late String forumId;
  late String userId;

  ForumLikes({required this.forumId, required this.userId});

  ForumLikes.fromJson(Map<String, dynamic> json) {
    forumId = json['forumId'];
    userId = json['userId'];
  }
}

class ForumComments {
  late String forumCommentId;
  late String forumId;
  late String userId;
  late String comment;
  late String createdAt;

  ForumComments(
      {required this.forumCommentId,
      required this.forumId,
      required this.userId,
      required this.comment,
      required this.createdAt});

  ForumComments.fromJson(Map<String, dynamic> json) {
    forumCommentId = json['forumCommentId'];
    forumId = json['forumId'];
    userId = json['userId'];
    comment = json['comment'];
    createdAt = json['createdAt'];
  }
}
