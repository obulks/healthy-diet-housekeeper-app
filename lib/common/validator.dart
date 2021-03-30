import 'package:healthy_diet_housekeeper/public.dart';

class Validator {
  static bool phone(String v) {
    v = v.trim();
    RegExp regExp = new RegExp(
        r'^1(3\d|4[5-9]|5[0-35-9]|6[567]|7[0-8]|8\d|9[0-35-9])\d{8}$');
    if (v.length == 0) {
      Toast.show("请输入您的手机号");
      return false;
    }
    if (v.length != 11 || regExp.hasMatch(v) != true) {
      Toast.show("请检查您的手机号");
      return false;
    }
    return true;
  }

  static bool authCode(String v) {
    v = v.trim();
    RegExp regExp = new RegExp(r"\d{6}$");

    if (v.length == 0) {
      Toast.show('请输入您的验证码');
      return false;
    }

    if (v.length != 6 || regExp.hasMatch(v) != true) {
      Toast.show('请检查验证码格式');
      return false;
    }

    return true;
  }
}
