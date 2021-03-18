import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class ToLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Container(
      // padding: EdgeInsets.only(left: (375-32-80)/2),
      width: 80.px,
      height: 32.px,
      child: Center(
        child: Text(
          '点击登录',
          style: TextStyle(
            fontSize: 14.px,
            color: Colors.black38,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.px)),
        boxShadow: [
          BoxShadow(
            color: Color(0xffcccccc).withOpacity(0.5),
            offset: Offset(0, 2),
            blurRadius: 1,
          ),
        ],
      ),
    );
  }
}
