import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:healthy_diet_housekeeper/common/size_fit.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';
import '../widgets/login_form_authcode_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _telController = new TextEditingController();
  TextEditingController _authCodeController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return Scaffold(
      body: SafeArea(
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
                        controller: _telController,
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
                            borderSide: BorderSide(color: Color(0xffCCCCCC)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffCCCCCC)),
                          ),
                        ),
                        // 校验用户名
                        validator: (v) {
                          return v.trim().length > 0 ? null : "用户名不能为空";
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.px,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 48.px),
                      child: TextFormField(
                        controller: _authCodeController,
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
                            borderSide: BorderSide(color: Color(0xffCCCCCC)),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffCCCCCC)),
                          ),
                          suffixIcon: LoginFormAuthCodeButton(
                            onTapCallback: () {
                              // 点击获取验证码后要执行的回调
                              print('tap');
                            },
                          ),
                        ),
                        // 校验用户名
                        validator: (v) {
                          return v.trim().length > 0 ? null : "手机号码不能为空";
                        },
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
              width: 320,
              height: 50,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                splashColor: Colors.transparent,
                highlightColor: Color(0xff00C4A2),
                elevation: 0,
                highlightElevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(
                  '登录',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.px,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
