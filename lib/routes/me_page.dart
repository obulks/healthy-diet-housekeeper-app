import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person_add),
        heroTag: 'me button',
        onPressed: (){
          Navigator.pushNamed(context, '/login');
        },
      ),
    );
  }
}
