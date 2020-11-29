import 'package:flutter/material.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '我的',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.px,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        heroTag: 'me button',
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }
}
