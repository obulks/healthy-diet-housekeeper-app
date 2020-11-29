import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/common/store.dart';
import 'package:healthy_diet_housekeeper/widgets/food_group_panel.dart';
import 'package:provider/provider.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';
import '../widgets/food_custom_search_delegate.dart';

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
        title: Text(
          '食物成分查询',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.px,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: 30.px,
            ),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: <Widget>[
              FoodGroupPanel(),
            ],
          ),
        ),
      ),
    );
  }
}
