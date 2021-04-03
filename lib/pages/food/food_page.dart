import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class FoodPage extends StatefulWidget {
  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '食物成分查询',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.px,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.px),
            child: GestureDetector(
              child: Icon(
                Icons.search,
                size: 28.px,
                color: Colors.white,
              ),
              onTap: _toSearchPage,
            ),
          )
        ],
      ),
      body: MyScrollConfiguration(
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Container(
            child: Column(
              children: <Widget>[
                FoodGroupPanel(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _toSearchPage() {
    Navigator.push(
      context,
      FadeRoute(
        page: FoodSearchPage(),
      ),
    );
  }
}
