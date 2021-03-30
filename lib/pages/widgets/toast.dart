import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class Toast {
  static void show(String msg) {
    showToast(
      msg,
      backgroundColor: Colors.black54,
      radius: 10.px,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 12.px,
      ),
      position: ToastPosition(
        align: Alignment.topCenter,
        offset: 20.px,
      ),
      duration: Duration(
        seconds: 3,
        // milliseconds: 500,
      ),
      textPadding: EdgeInsets.only(
        top: 7.px,
        bottom: 7.px,
        left: 10.px,
        right: 10.px,
      ),
    );
  }
}
