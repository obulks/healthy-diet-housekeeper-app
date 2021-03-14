import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
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
