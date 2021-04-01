import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _authCode = "";
  String _phone = "";
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
                                phoneController: _phoneController,
                                formKey: _formKey,
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
    if (!Validator.phone(_phone) || !Validator.authCode(_authCode)) {
      return;
    }

    Login loginResult = await UserApi.login(_phone, _authCode);

    // 状态200表示登录成功
    if (loginResult.code == 200) {
      // 存储登录状态和token
      LocalStorage.set<bool>('login', true);
      LocalStorage.set<String>('token', loginResult.data.token);
      // 替换路由
      Navigator.pushReplacementNamed(context, '/');
    } else {
      Toast.show('登录失败：${loginResult.msg}');
      return;
    }
  }

  _getAuthCode() async {
    Sms smsResult = await SmsApi.send(_phone);
    if (smsResult.code == 200) {
      Toast.show(smsResult.msg);
    } else {
      Toast.show(smsResult.msg);
    }
  }
}
