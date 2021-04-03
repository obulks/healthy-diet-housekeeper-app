import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _buttonIcons;
  // 参考摄入量
  double _referenceCalorie;
  // 当前摄入量
  double _intakeCalorie;
  // 剩余摄入量
  double _residualCalorie;

  void _initData() {
    _buttonIcons = [
      Image.asset('assets/icons/breakfast.png', width: 32.px, height: 32.px),
      Image.asset('assets/icons/lunch.png', width: 32.px, height: 32.px),
      Image.asset('assets/icons/dinner.png', width: 32.px, height: 32.px),
      Image.asset('assets/icons/snack2.png', width: 32.px, height: 32.px),
    ];
    _referenceCalorie = 1980;
    _intakeCalorie = 1593;
    _residualCalorie = _referenceCalorie - _intakeCalorie;
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    _initData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          '首页',
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
      body: MyScrollConfiguration(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: Color(0xffF7F8F9),
            child: Column(
              children: [
                Container(
                  width: 345.px,
                  height: 210.px,
                  margin: EdgeInsets.only(
                    top: 24.px,
                    right: 16.px,
                    left: 16.px,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.px)),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xffcccccc).withOpacity(0.5),
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 8.px,
                        right: 8.px,
                        child: Text(
                          '单位：千卡',
                          style: TextStyle(
                            fontSize: 11.px,
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20.px,
                        left: 122.px,
                        child: CircularPercentIndicator(
                          radius: 100.px,
                          lineWidth: 10.px,
                          animation: true,
                          animationDuration: 800,
                          percent: () {
                            if (_intakeCalorie > _referenceCalorie) {
                              return 1.0;
                            }
                            return (_intakeCalorie / _referenceCalorie)
                                .toDouble();
                          }(),
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor:
                              Theme.of(context).primaryColor.withOpacity(.2),
                          progressColor: Theme.of(context).primaryColor,
                        ),
                      ),
                      Positioned(
                        top: 48.px,
                        left: 32.px,
                        child: ShowCalorie(
                          animation: false,
                          text: '推荐',
                          upperBound: _referenceCalorie,
                        ),
                      ),
                      Positioned(
                        top: 48.px,
                        left: 142.px,
                        child: ShowCalorie(
                          animation: true,
                          text: '摄入',
                          upperBound: _intakeCalorie,
                        ),
                      ),
                      Positioned(
                        top: 48.px,
                        right: 32.px,
                        child: ShowCalorie(
                          animation: true,
                          text: () {
                            if (_intakeCalorie > _referenceCalorie) {
                              return '超出';
                            }
                            return '剩余';
                          }(),
                          upperBound: () {
                            if (_intakeCalorie > _referenceCalorie) {
                              return _intakeCalorie - _referenceCalorie;
                            }
                            return _residualCalorie;
                          }(),
                        ),
                      ),
                      Positioned(
                        bottom: 16.px,
                        left: 16.px,
                        child: ShowMacronutrient(
                          text: '蛋白质',
                          total: '20',
                          curr: '11',
                          percent: 11 / 20,
                          backgroundColor: Color(0xff9999ff).withOpacity(.4),
                          progressColor: Color(0xff9999ff),
                        ),
                      ),
                      Positioned(
                        bottom: 16.px,
                        left: 132.px,
                        child: ShowMacronutrient(
                          text: '碳水化合物',
                          total: '54',
                          curr: '15',
                          percent: 15 / 54,
                          backgroundColor: Color(0xffff8080).withOpacity(.4),
                          progressColor: Color(0xffff8080),
                        ),
                      ),
                      Positioned(
                        bottom: 16.px,
                        right: 16.px,
                        child: ShowMacronutrient(
                          text: '脂肪',
                          total: '24',
                          curr: '6',
                          percent: 6 / 24,
                          backgroundColor: Color(0xffffb366).withOpacity(.4),
                          progressColor: Color(0xffffb366),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.px,
                ),
                RecordFoodButton(
                  icon: _buttonIcons[0],
                  title: '早餐',
                  subTitle: '建议不超过432千卡',
                  onTap: () {
                    print('早餐');
                  },
                ),
                RecordFoodButton(
                  icon: _buttonIcons[1],
                  title: '午餐',
                  subTitle: '建议不超过432千卡',
                  onTap: () {
                    print('午餐');
                  },
                ),
                RecordFoodButton(
                  icon: _buttonIcons[2],
                  title: '晚餐',
                  subTitle: '建议不超过432千卡',
                  onTap: () {
                    print('晚餐');
                  },
                ),
                RecordFoodButton(
                  icon: _buttonIcons[3],
                  title: '加餐',
                  subTitle: '建议不超过432千卡',
                  onTap: () {
                    print('加餐');
                  },
                ),
                // SizedBox(height: 100.px,)
              ],
            ),
          ),
        ),
      ), // 构建主页面
    );
  }
}
