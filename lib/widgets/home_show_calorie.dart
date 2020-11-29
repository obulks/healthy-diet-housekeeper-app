import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class ShowCalorie extends StatefulWidget {
  final int animationDuration;
  final bool animation;
  final double lowerBound;
  final double upperBound;
  final String text;

  ShowCalorie({
    this.text,
    this.animationDuration = 1000,
    this.animation = false,
    this.lowerBound = 0,
    @required this.upperBound,
  });
  @override
  _ShowCalorieState createState() => _ShowCalorieState();
}

class _ShowCalorieState extends State<ShowCalorie>
    with TickerProviderStateMixin {
  AnimationController animationController;
  int showValue;

  @override
  void initState() {
    showValue = widget.upperBound.toInt();
    // animation 为 true 才执行动画
    if (widget.animation) {
      // if(!widget.animation) {
      //   return;
      // }
      animationController = AnimationController(
        lowerBound: widget.lowerBound,
        upperBound: widget.upperBound,
        duration: Duration(milliseconds: widget.animationDuration),
        vsync: this,
      );

      animationController.addListener(() {
        // print('${animationController.value}');
        setState(() {
          showValue = animationController.value.toInt();
        });
      });

      animationController.forward();
    }
    super.initState();
  }

  @override
  void dispose() {
    if(animationController != null) {
      animationController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Container(
      width: 60.px,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${widget.text}',
            style: TextStyle(
              fontSize: 12.px,
              color: Color(0xff222222),
            ),
          ),
          SizedBox(
            height: 4.px,
          ),
          Text(
            '$showValue',
            style: TextStyle(
              fontSize: 22.px,
              fontWeight: FontWeight.w600,
              color: Color(0xff222222),
            ),
          ),
        ],
      ),
    );
  }
}
