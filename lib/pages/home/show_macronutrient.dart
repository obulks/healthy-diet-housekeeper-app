import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class ShowMacronutrient extends StatelessWidget {
  final String text;
  final String total;
  final String curr;
  final double percent;
  final Color progressColor;
  final Color backgroundColor;

  ShowMacronutrient(
      {this.text,
        this.total,
        this.curr,
        this.percent = 0.5,
        this.progressColor,
        this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Container(
      width: 80.px,
      // height: 60.px,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$text',
            style: TextStyle(fontSize: 11.px, color: Color(0xff222222)),
          ),
          SizedBox(
            height: 8.px,
          ),
          LinearPercentIndicator(
            width: 80.px,
            lineHeight: 4.px,
            animation: true,
            animationDuration: 800,
            percent: percent,
            backgroundColor: backgroundColor,
            progressColor: progressColor,
            padding: EdgeInsets.all(2.px),
          ),
          SizedBox(
            height: 8.px,
          ),
          Text(
            '$curr/$total克',
            style: TextStyle(fontSize: 11.px, color: Color(0xff222222)),
          ),
        ],
      ),
    );
  }
}