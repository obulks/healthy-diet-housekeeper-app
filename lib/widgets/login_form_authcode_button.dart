import 'dart:async';
import 'package:flutter/material.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';

class LoginFormAuthCodeButton extends StatefulWidget {
  /// 倒计时的秒数，默认60秒。
  final int countdown;

  /// 用户点击时的回调函数。
  final Function onTapCallback;

  LoginFormAuthCodeButton({
    this.countdown: 60,
    this.onTapCallback,
  });

  @override
  _LoginFormAuthCodeButtonState createState() => _LoginFormAuthCodeButtonState();
}

class _LoginFormAuthCodeButtonState extends State<LoginFormAuthCodeButton> {
  Color _availableColor = Color(0xff3fdabf);
  Color _unavailableColor = Color(0xffA6ADBE);
  double _availableWidth = 80.px;
  double _unavailableWidth = 50.px;

  Color _currentColor = Color(0xff3fdabf);
  double _currentWidth = 80.px;

  Timer _timer;

  // 当前倒计时的秒数。
  int _seconds;

  // 当前的文本。
  String _verifyStr = '获取验证码';

  @override
  void initState() {
    super.initState();
    _seconds = widget.countdown;
  }

  void _startTimer() {
    _timer = Timer.periodic(
        Duration(seconds: 1),
            (Timer timer) => {
          setState(() {
            if (_seconds <= 0) {
              _verifyStr = '重新获取';
              _timer.cancel();
              _seconds = 60;
              _currentColor = _availableColor;
              _currentWidth = _availableWidth;
            } else {
              _seconds -= 1;
              _verifyStr = '${_seconds}s';
              _currentColor = _unavailableColor;
              _currentWidth = _unavailableWidth;
            }
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Container(
      width: _currentWidth,
      height: 30.px,
      // padding: EdgeInsets.only(
      //   top: 8.px,
      //   bottom: 8.px,
      // ),
      padding: EdgeInsets.symmetric(vertical: 8),

      child: OutlineButton(
        padding: EdgeInsets.all(0),
        child: Text(
          '$_verifyStr',
          style: TextStyle(fontSize: 11.px, color: _currentColor),
        ),
        borderSide: BorderSide(
          color: _currentColor,
          style: BorderStyle.solid,
          width: 1,
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        highlightedBorderColor: _currentColor,
        shape: RoundedRectangleBorder(
          //圆角属性
          borderRadius: BorderRadius.circular(15),
        ),
        // 按钮在点击后不可用
        onPressed: _seconds == 60
            ? () {
          _startTimer();
          widget.onTapCallback();
        }
            : null,
      ),
    );
  }
}