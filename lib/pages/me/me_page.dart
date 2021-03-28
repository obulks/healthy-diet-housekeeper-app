import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/pages/demo/demo.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
  var _icons;

  // 登录标记，true为已登录，false为未登录
  bool _loginFlag;

  void _initData() {
    _icons = [
      Image.asset('assets/icons/me_page/dongtai.png',
          width: 24.px, height: 24.px),
      Image.asset('assets/icons/me_page/shouchang.png',
          width: 24.px, height: 24.px),
      Image.asset('assets/icons/me_page/jbxx.png', width: 24.px, height: 24.px),
      Image.asset('assets/icons/me_page/jkbg.png', width: 24.px, height: 24.px),
      Image.asset('assets/icons/me_page/ysjl.png', width: 24.px, height: 24.px),
    ];
  }

  @override
  void initState() {
    super.initState();
    _initData();
    _loginFlag = false;
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.px),
            child: GestureDetector(
              child: Icon(
                Icons.settings_outlined,
                size: 26.px,
                color: Colors.white,
              ),
              onTap: () {
                print('setting tap');
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 16.px),
            child: GestureDetector(
              child: Icon(
                Icons.email_outlined,
                size: 28.px,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pushNamed(context, '/login');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Demo()),
                );
                print('message tap');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffF7F8F9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 100.px,
                    margin: EdgeInsets.only(bottom: 64 / 2.px),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  _loginFlag == true
                      ? Positioned(
                          top: 8.px,
                          left: 16.px,
                          child: UserBar(
                            username: null,
                            avatarUrl:
                                'http://tiebapic.baidu.com/forum/w%3D580/sign=5183bf97e5d3572c66e29cd4ba126352/0816213fb80e7bec0fb5eb9f382eb9389b506b7c.jpg',
                            onTap: () {
                              print('edit username');
                            },
                          ),
                        )
                      : Positioned(
                          top: 16.px,
                          left: ((375 - 80) / 2).px,
                          child: GestureDetector(
                            child: ToLogin(),
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                              _loginFlag = !_loginFlag;
                            },
                          ),
                        ),
                  Positioned(
                    bottom: 0,
                    left: ((375 - 344) / 2).px,
                    child: Container(
                      width: 344.px,
                      height: 64.px,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.px),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.5), //阴影颜色
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FnButton(
                              icon: _icons[0], title: '我的动态', onTap: () {}),
                          FnButton(
                              icon: _icons[1], title: '我的收藏', onTap: () {}),
                          FnButton(
                              icon: _icons[0], title: '后续更新', onTap: () {}),
                          FnButton(
                              icon: _icons[0], title: '后续更新', onTap: () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.px,
              ),
              Container(
                width: 344.px,
                height: 373.px,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.px),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.5), //阴影颜色
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 10.px,
                            bottom: 10.px,
                            left: 16.px,
                          ),
                          child: Text(
                            '我的健康资料',
                            style: TextStyle(
                                color: Color(0xff333E57),
                                fontSize: 13.px,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                    Divider(height: 0, color: Color(0xffDCE0E7)),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 16.px,
                            bottom: 16.px,
                            left: 16.px,
                            right: 18.px,
                          ),
                          child: _icons[2],
                        ),
                        Container(
                          child: Text('基本信息'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 200.px),
                          child: Text(
                            '>',
                            style: TextStyle(
                              color: Color(0xffDCE0E7),
                              fontSize: 18.px,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16.px, right: 16.px),
                      child: Divider(height: 0, color: Color(0xffDCE0E7)),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 16.px,
                            bottom: 16.px,
                            left: 16.px,
                            right: 18.px,
                          ),
                          child: _icons[3],
                        ),
                        Container(
                          child: Text('健康报告'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 200.px),
                          child: Text(
                            '>',
                            style: TextStyle(
                              color: Color(0xffDCE0E7),
                              fontSize: 18.px,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16.px, right: 16.px),
                      child: Divider(height: 0, color: Color(0xffDCE0E7)),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 16.px,
                            bottom: 16.px,
                            left: 16.px,
                            right: 18.px,
                          ),
                          child: _icons[4],
                        ),
                        Container(
                          child: Text('饮食记录'),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 200.px),
                          child: Text(
                            '>',
                            style: TextStyle(
                              color: Color(0xffDCE0E7),
                              fontSize: 18.px,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16.px, right: 16.px),
                      child: Divider(height: 0, color: Color(0xffDCE0E7)),
                    ),
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
