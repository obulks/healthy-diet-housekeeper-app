import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';
import 'dart:math' as math;

class AppHomeScreen extends StatefulWidget {
  @override
  _AppHomeScreenState createState() => _AppHomeScreenState();
}

class _AppHomeScreenState extends State<AppHomeScreen> {
  int _tabIndex = 0;
  bool _isLogin;
  List<List<Image>> _tabImages;
  List<String> _appBarTitles = ['首页', '食材', '', '发现', '我的'];
  List<Widget> _pageList;
  final _bottomSheetScaffoldKey = GlobalKey<ScaffoldState>();
  final _bottomNavigationBarKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    _initResources();
    // 如果未登录则加载登录页
    return _isLogin == true ? _appHomeScreenWidget() : LoginPage();
  }

  Future _validateLogin() async {
    // LocalStorage.clear();
    var result = await LocalStorage.get('login');
    print('app_home_screen.dart result: $result');

    if (result == true) {
      setState(() {
        _isLogin = true;
      });
    } else {
      setState(() {
        _isLogin = false;
      });
    }
  }

  // 获得正常状态或是点击状态的图标
  Image _getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return _tabImages[curIndex][1];
    }
    return _tabImages[curIndex][0];
  }

  // 根据image路径获取图片
  Image _getTabImage(path) {
    return Image.asset(path, width: 24.px, height: 24.px);
  }

  void _initResources() {
    _tabImages = [
      [
        _getTabImage('assets/icons/tab1.png'),
        _getTabImage('assets/icons/tab1s.png'),
      ],
      [
        _getTabImage('assets/icons/tab2.png'),
        _getTabImage('assets/icons/tab2s.png'),
      ],
      [
        _getTabImage('assets/icons/tab3.png'),
        _getTabImage('assets/icons/tab3s.png'),
      ],
      [
        _getTabImage('assets/icons/tab3.png'),
        _getTabImage('assets/icons/tab3s.png'),
      ],
      [
        _getTabImage('assets/icons/tab4.png'),
        _getTabImage('assets/icons/tab4s.png'),
      ],
    ];
    /*
     * 5个子界面
     */
    _pageList = [
      HomePage(),
      FoodPage(),
      Container(),
      FindPage(),
      MePage(),
    ];
  }

  static const FloatingActionButtonLocation centerDocked =
      _CenterDockedFloatingActionButtonLocation();

  @override
  void initState() {
    super.initState();
    _validateLogin();
  }

  Widget _appHomeScreenWidget() {
    return Scaffold(
      key: _bottomSheetScaffoldKey,
      body: _pageList[_tabIndex],
      bottomNavigationBar: SizedBox(
        height: 56.px,
        child: BottomNavigationBar(
          key: _bottomNavigationBarKey,
          currentIndex: _tabIndex,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12.px,
          unselectedFontSize: 12.px,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Color(0xffDCE0E7),
          items: [
            BottomNavigationBarItem(
                icon: _getTabIcon(0), label: '${_appBarTitles[0]}'),
            BottomNavigationBarItem(
                icon: _getTabIcon(1), label: '${_appBarTitles[1]}'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: ''),
            BottomNavigationBarItem(
                icon: _getTabIcon(3), label: '${_appBarTitles[3]}'),
            BottomNavigationBarItem(
                icon: _getTabIcon(4), label: '${_appBarTitles[4]}'),
          ],
          onTap: (index) {
            _bottomNavigationChange(index);
          },
        ),
      ),
      floatingActionButton: Container(
        width: 40.px,
        height: 40.px,
        child: FloatingActionButton(
          child: Icon(Icons.add, size: 24.px),
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          highlightElevation: 0,
          onPressed: _openModalBottomSheet,
        ),
      ),
      floatingActionButtonLocation: centerDocked,
    );
  }

  _bottomNavigationChange(int index) {
    if (index != 2) {
      setState(() {
        _tabIndex = index;
      });
    }
  }

  void _openModalBottomSheet() async {
    final option = await showModalBottomSheet(
      context: context,
      elevation: 16,
      builder: (context) => BottomSheetContent(),
      barrierColor: Colors.transparent,
    );
    if (option != null) {
      switch (option) {
        case 0:
          print('记饮食');
          break;
        case 1:
          print('菜品识别');
          break;
        case 2:
          print('发动态');
          break;
      }
    }
  }
}

// 实现FloatingActionButton位置定位到TabBar中
class _CenterDockedFloatingActionButtonLocation
    extends _DockedFloatingActionButtonLocation {
  const _CenterDockedFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2.0;
    final double fabY = (scaffoldGeometry.scaffoldSize.height -
            scaffoldGeometry.floatingActionButtonSize.height) -
        8.px;
    // 返回要设置的坐标
    return Offset(fabX, fabY);
  }
}

abstract class _DockedFloatingActionButtonLocation
    extends FloatingActionButtonLocation {
  const _DockedFloatingActionButtonLocation();
  @protected
  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentTop;
    final double appBarHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = contentBottom - fabHeight / 2.0;
    if (snackBarHeight > 0.0)
      fabY = math.min(
          fabY,
          contentBottom -
              snackBarHeight -
              fabHeight -
              kFloatingActionButtonMargin);
    if (appBarHeight > 0.0)
      fabY = math.min(fabY, contentBottom - appBarHeight - fabHeight / 2.0);

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return math.min(maxFabY, fabY);
  }
}
