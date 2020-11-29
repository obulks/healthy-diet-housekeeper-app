import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';
import '../widgets/home_show_macronutrient.dart';
import '../widgets/home_show_calorie.dart';
import '../widgets/home_record_food_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var buttonIcons;

  void initData() {
    buttonIcons = [
      Image.asset('assets/icons/breakfast.png', width: 32.px, height: 32.px),
      Image.asset('assets/icons/lunch.png', width: 32.px, height: 32.px),
      Image.asset('assets/icons/dinner.png', width: 32.px, height: 32.px),
      Image.asset('assets/icons/snack2.png', width: 32.px, height: 32.px),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    initData();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '首页',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.px,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
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
      body: SingleChildScrollView(
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
                      top: 16.px,
                      left: 122.px,
                      child: CircularPercentIndicator(
                        radius: 100.px,
                        lineWidth: 12.px,
                        animation: true,
                        animationDuration: 800,
                        percent: 0.7,
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
                        upperBound: 1998,
                      ),
                    ),
                    Positioned(
                      top: 48.px,
                      left: 142.px,
                      child: ShowCalorie(
                        animation: true,
                        text: '剩余',
                        lowerBound: 600,
                        upperBound: 1798,
                      ),
                    ),
                    Positioned(
                      top: 48.px,
                      right: 32.px,
                      child: ShowCalorie(
                        animation: false,
                        text: '摄入',
                        upperBound: 200,
                      ),
                    ),
                    Positioned(
                      bottom: 16.px,
                      left: 16.px,
                      child: ShowMacronutrient(
                        text: '蛋白质',
                        total: '20',
                        curr: '11',
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
                        percent: 0.4,
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
                icon: buttonIcons[0],
                title: '早餐',
                subTitle: '建议不超过432千卡',
                onTap: () {
                  print('早餐');
                },
              ),
              RecordFoodButton(
                icon: buttonIcons[1],
                title: '午餐',
                subTitle: '建议不超过432千卡',
                onTap: () {
                  print('午餐');
                },
              ),
              RecordFoodButton(
                icon: buttonIcons[2],
                title: '晚餐',
                subTitle: '建议不超过432千卡',
                onTap: () {
                  print('晚餐');
                },
              ),
              RecordFoodButton(
                icon: buttonIcons[3],
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
      ), // 构建主页面
    );
  }
}
