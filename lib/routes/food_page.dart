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
                delegate: CustomSearchDelegate(

                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              FoodGroupPanel(),
              Container(
                child: Text(
                  '食物分类',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 480.px,
                padding: EdgeInsets.only(
                  top: 24.px,
                  left: 24.px,
                  right: 24.px,
                ),
                child: GridView.count(
                  // scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.px,
                  mainAxisSpacing: 16.px,
                  children: List.generate(18, (index) {
                    return Container(
                      // width: 56.px,
                      alignment: Alignment(0, 0),
                      child: Text(
                        '零食饮料',
                        style: TextStyle(
                            fontSize: 13.px, color: Color(0xff222222)),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.px),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffcccccc),
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
