import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  @override
  Widget build(BuildContext context) {
    var _mediaQueryData = MediaQuery.of(context);
    SizeFit.initialize(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      // height: MediaQuery.of(context).size.height / 2,
      height: 240.px,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Positioned(
            top: 16.px,
            left: 16.px,
            child: Column(
              children: [
                Container(
                  width: 50.px,
                  height: 50.px,
                  child: RaisedButton(
                    padding: EdgeInsets.all(0),
                    color: Color(0xffffb791).withOpacity(0.5),
                    splashColor: Colors.transparent,
                    elevation: 0,
                    highlightElevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      // 传递参数 0、1、2 给上一个页面，表示第一个选项、第二......
                      Navigator.pop(context, 0);
                    },
                    child: Icon(
                      Icons.restaurant_menu,
                      color: Color(0xffff8f53),
                    ),
                  ),
                ),
                Text(
                  '记饮食',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16.px,
            left: 82.px,
            child: Column(
              children: [
                Container(
                  width: 50.px,
                  height: 50.px,
                  child: RaisedButton(
                    padding: EdgeInsets.all(0),
                    color: Color(0xff53e2ff).withOpacity(0.5),
                    splashColor: Colors.transparent,
                    elevation: 0,
                    highlightElevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.px),
                    ),
                    onPressed: () {
                      Navigator.pop(context, 1);
                    },
                    child: Icon(
                      Icons.camera_alt,
                      color: Color(0xff28d7fb),
                    ),
                  ),
                ),
                Text(
                  '菜品识别',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            top: 16.px,
            left: 148.px,
            child: Column(
              children: [
                Container(
                  width: 50.px,
                  height: 50.px,
                  child: RaisedButton(
                    padding: EdgeInsets.all(0),
                    splashColor: Colors.transparent,
                    color: Color(0xff96f562).withOpacity(0.5),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.px),
                    ),
                    onPressed: () {
                      Navigator.pop(context, 2);
                    },
                    child: Icon(
                      Icons.edit,
                      size: 24.px,
                      color: Color(0xff9adc76),
                    ),
                  ),
                ),
                Text(
                  '发动态',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            left: _mediaQueryData.size.width / 2 - 20.px,
            bottom: 7.px,
            child: GestureDetector(
              child: Container(
                width: 40.px,
                height: 40.px,
                child: Icon(
                  Icons.close,
                  size: 24.px,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
