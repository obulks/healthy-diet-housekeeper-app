import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';
import '../widgets/show_macronutrient.dart';
import '../widgets/show_calorie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
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
                Icons.search,
                size: 32.px,
                color: Colors.white,
              ),
              onTap: () {
                print('tap');
              },
            ),
          ),
        ],
      ),
      body: Container(
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
          ],
        ),
      ), // 构建主页面
    );
  }
}

