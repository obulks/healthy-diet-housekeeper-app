import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _authCode;
  String _phone;
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _authCodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      body: GestureDetector(
        // 点击空白处键盘收起
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 128.px,
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 48.px),
                      child: Text(
                        '手机号登录/注册',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 19.px,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 37.px,
                ),
                Container(
                  padding: EdgeInsets.only(left: 48.px),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 71.px),
                          child: TextFormField(
                            controller: _phoneController,
                            onSaved: (value) {
                              _phone = value;
                            },
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            cursorWidth: 1,
                            decoration: InputDecoration(
                              hintText: "输入手机号码",
                              hintStyle: TextStyle(
                                fontSize: 13.px,
                                color: Color(0xffCCCCCC),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffCCCCCC)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffCCCCCC)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16.px,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 48.px),
                          child: TextFormField(
                            controller: _authCodeController,
                            onSaved: (value) {
                              _authCode = value;
                            },
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.black,
                            cursorWidth: 1,
                            decoration: InputDecoration(
                              hintText: "请输入验证码",
                              hintStyle: TextStyle(
                                fontSize: 13.px,
                                color: Color(0xffCCCCCC),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffCCCCCC)),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xffCCCCCC)),
                              ),
                              suffixIcon: AuthCodeButton(
                                onTapCallback: _getAuthCode,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 14.px,
                        ),
                        Row(
                          children: [
                            Text(
                              '未注册的手机号验证后自动创建账户',
                              style: TextStyle(
                                color: Color(0xffCCCCCC),
                                fontSize: 11.px,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 87.px,
                ),
                Container(
                  width: 320.px,
                  height: 50.px,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  child: Material(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(25.px),
                    child: InkWell(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(25.px),
                      child: Container(
                        width: 200.px,
                        height: 60.px,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.px),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '登录',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.px,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      onTap: _handleLogin,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _handleLogin() async {
    // 保存输入框的值
    _formKey.currentState.save();
    // 手机号和验证码校验不通过则退出函数
    if (!_validatorPhone(_phone) || !_validatorAuthCode(_authCode)) {
      return;
    }

    Login loginResult = await UserApi.login(_phone, _authCode);
    if (loginResult.code == 200) {
      // 存储登录状态和token
      LocalStorage.set<bool>('login', true);
      LocalStorage.set<String>('token', loginResult.data.token);
      // 替换路由
      Navigator.pushReplacementNamed(context, '/');
    } else {
      Toast.show(loginResult.msg);
      return;
    }

    print('login_page: login');
    Toast.show('登录成功');
  }

  _getAuthCode() async {
    if (_validatorPhone(_phone)) {
      Sms smsResult = await SmsApi.send(_phone);
      if (smsResult.code == 200) {
        Toast.show(smsResult.msg);
      } else {
        Toast.show(smsResult.msg);
      }
    }
  }

  bool _validatorPhone(v) {
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

  bool _validatorAuthCode(v) {
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
