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
        title: Text('title'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FoodItem2(),
            FoodItem2(),
            FoodItem2(),
            FoodItem2(),
          ],
        ),
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

class FoodItem2 extends StatelessWidget {
  // final Foods food;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return GestureDetector(
      onTap: () => _toFoodDetailPage(),
      child: Card(
        elevation: 4.0,
        // margin: EdgeInsets.symmetric(
        //   horizontal: 10.0,
        //   vertical: 6.0,
        // ),
        child: Container(
          // height: 64.0,
          decoration: BoxDecoration(
            color: Colors.white70,
          ),
          child: ListTile(
            // contentPadding:
            // EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              child: Icon(
                Icons.autorenew,
                color: Colors.grey,
              ),
            ),
            title: Text(
              "苹果",
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
            // subtitle: Text("中级", style: TextStyle(color: Colors.white)),
            subtitle: Row(
              children: <Widget>[
                Text(
                  "100毫克",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
            trailing: Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black54,
              size: 30.0,
            ),
          ),
        ),
      ),
    );
  }

  _toFoodDetailPage() {
    print('to food detail page');
  }
}


