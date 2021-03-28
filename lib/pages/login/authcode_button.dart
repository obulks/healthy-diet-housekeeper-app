import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class AuthCodeButton extends StatefulWidget {
  /// 倒计时的秒数，默认60秒。
  final int countdown;

  /// 用户点击时的回调函数。
  final Function onTapCallback;

  AuthCodeButton({
    this.countdown: 60,
    this.onTapCallback,
  });

  @override
  _AuthCodeButtonState createState() => _AuthCodeButtonState();
}

class _AuthCodeButtonState extends State<AuthCodeButton> {
  Color _availableColor = Color(0xff3fdabf);
  Color _unavailableColor = Color(0xffA6ADBE);
  double _availableWidth = 80.px;
  double _unavailableWidth = 50.px;

  Color _currentColor = Color(0xff3fdabf);
  double _currentWidth = 80.px;

  Timer _timer;

  // 当前倒计时的秒数。
  int _seconds = 60;

  // 当前的文本。
  String _verifyStr = '获取验证码';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(
        Duration(seconds: 1),
        (Timer timer) => {
              setState(() {
                if (_seconds < 1) {
                  _timer.cancel();
                  _verifyStr = '获取验证码';
                  _seconds = 60;
                  _currentColor = _availableColor;
                  _currentWidth = _availableWidth;
                } else {
                  _seconds -= 1;
                  _verifyStr = '$_seconds秒';
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
                setState(() {
                  _seconds = 60;
                  _verifyStr = '$_seconds秒';
                  _currentColor = _unavailableColor;
                  _currentWidth = _unavailableWidth;
                });
                _startTimer();
                widget.onTapCallback();
              }
            : null,
      ),
    );
  }
}
