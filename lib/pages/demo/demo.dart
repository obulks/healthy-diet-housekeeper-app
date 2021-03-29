import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  LocalStorage _localStorage;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('demo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'text',
              style: TextStyle(
                fontSize: 40.px,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              _saveData();
            },
            child: Text('set'),
          ),
          RaisedButton(
            onPressed: () {
              _getData();
            },
            child: Text('get'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveData();
        },
      ),
    );
  }

  _saveData() {
    LocalStorage.set<bool>('login', true);
  }
  _getData() async {
    // print(await _localStorage.get('login'));
    // print(await UserApi.login('1'));
  }

  @override
  void initState() {
    super.initState();
  }
}
