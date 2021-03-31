import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/pages/find/news_detail_page.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('demo'),
      ),
      body: SingleChildScrollView(
        child: Container(child: Text('demo')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String uniquekey = 'e30d4d88c9b8977d9d39667449562752';
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewsDetailPage(
                uniquekey: uniquekey,
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
