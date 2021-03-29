class User {
  String username;
  String password;
  _BodyInfo bodyInfo;

  User({this.username, this.password, this.bodyInfo});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    bodyInfo = json['body_info'] != null
        ? new _BodyInfo.fromJson(json['body_info'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    if (this.bodyInfo != null) {
      data['body_info'] = this.bodyInfo.toJson();
    }
    return data;
  }
}

class _BodyInfo {
  String sex;
  String birthday;
  int height;
  int weight;

  _BodyInfo({this.sex, this.birthday, this.height, this.weight});

  _BodyInfo.fromJson(Map<String, dynamic> json) {
    sex = json['sex'];
    birthday = json['birthday'];
    height = json['height'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sex'] = this.sex;
    data['birthday'] = this.birthday;
    data['height'] = this.height;
    data['weight'] = this.weight;
    return data;
  }
}
