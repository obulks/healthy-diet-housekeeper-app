import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: Text(
            '发现',
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
                  Icons.email_outlined,
                  size: 28.px,
                  color: Colors.white,
                ),
                onTap: () {
                  print('tap');
                },
              ),
            ),
          ],
        ),
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                color: Colors.white,
                child: Material(
                  color: Colors.white,
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Theme.of(context).primaryColor,
                    labelStyle: TextStyle(
                      fontSize: 14.px,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelColor: Color(0xff333E57),
                    unselectedLabelStyle: TextStyle(
                      fontSize: 14.px,
                      fontWeight: FontWeight.bold,
                    ),
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Theme.of(context).primaryColor,
                    tabs: [
                      Container(
                        child: Tab(
                          text: '推荐',
                        ),
                      ),
                      Container(
                        child: Tab(
                          text: '健康资讯',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    RecommendPage(),
                    NewsPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
