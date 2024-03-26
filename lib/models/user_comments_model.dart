

class UserComments {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  UserComments({this.postId, this.id, this.name, this.email, this.body});

  UserComments.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }


}
