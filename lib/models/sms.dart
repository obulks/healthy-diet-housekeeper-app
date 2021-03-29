import 'package:healthy_diet_housekeeper/public.dart';

class Sms {
  int code;
  String msg;
  Data data;

  Sms({this.code, this.msg, this.data});

  Sms.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  String phone;
  String code;

  Data({this.phone, this.code});

  Data.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['code'] = this.code;
    return data;
  }
}
