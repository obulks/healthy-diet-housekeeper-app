import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/routes/find_page.dart';
import 'package:healthy_diet_housekeeper/routes/food_page.dart';
import 'package:healthy_diet_housekeeper/routes/home_page.dart';
import 'package:healthy_diet_housekeeper/routes/my_page.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';

class AppHomeScreen extends StatefulWidget {
  @override
  _AppHomeScreenState createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  int _tabIndex = 0;
  var tabImages;
  var appBarTitles = ['首页', '食材', '', '发现', '我的'];
  /*
   * 存放5个页面，跟fragmentList一样
   */
  var _pageList;

  /*
   * 根据选择获得对应的normal或是press的img
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  /*
   * 根据image路径获取图片
   */
  Image getTabImage(path) {
    return new Image.asset(path, width: 24.px, height: 24.px);
  }

  void initData() {
    tabImages = [
      [
        getTabImage('assets/icons/tab1.png'),
        getTabImage('assets/icons/tab1s.png'),
      ],
      [
        getTabImage('assets/icons/tab2.png'),
        getTabImage('assets/icons/tab2s.png'),
      ],
      [
        getTabImage('assets/icons/tab3.png'),
        getTabImage('assets/icons/tab3s.png'),
      ],
      [
        getTabImage('assets/icons/tab3.png'),
        getTabImage('assets/icons/tab3s.png'),
      ],
      [
        getTabImage('assets/icons/tab4.png'),
        getTabImage('assets/icons/tab4s.png'),
      ],
    ];
    /*
     * 5个子界面
     */
    _pageList = [
      new HomePage(),
      new FoodPage(),
      new Container(),
      new FindPage(),
      new MyPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    initData();
    return Scaffold(
      body: _pageList[_tabIndex],
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _tabIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12.px,
        unselectedFontSize: 12.px,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0xffDCE0E7),
        items: [
          new BottomNavigationBarItem(
              icon: getTabIcon(0), label: '${appBarTitles[0]}'),
          new BottomNavigationBarItem(
              icon: getTabIcon(1), label: '${appBarTitles[1]}'),
          new BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
          new BottomNavigationBarItem(
              icon: getTabIcon(3), label: '${appBarTitles[3]}'),
          new BottomNavigationBarItem(
              icon: getTabIcon(4), label: '${appBarTitles[4]}'),
        ],
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
      floatingActionButton: Container(
        width: 40.px,
        height: 40.px,
        child: FloatingActionButton(
          child: Icon(Icons.add, size: 32),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          highlightElevation: 0,
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
        location: FloatingActionButtonLocation.centerDocked,
        offsetX: 0,
        offsetY: 26.px,
      ),
    );
  }
}
class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  FloatingActionButtonLocation location;
  double offsetX; // X方向的偏移量
  double offsetY; // Y方向的偏移量
  CustomFloatingActionButtonLocation({this.location, this.offsetX, this.offsetY});

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    Offset offset = location.getOffset(scaffoldGeometry);
    return Offset(offset.dx + offsetX, offset.dy + offsetY);
  }
}
