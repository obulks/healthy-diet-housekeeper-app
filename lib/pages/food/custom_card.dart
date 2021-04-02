import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class CustomCard extends StatelessWidget {
  CustomCard({
    @required this.child,
    this.width,
    this.height,
    this.title,
  });

  final Widget child;
  final double width;
  final double height;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? null,
      height: height ?? null,
      margin: EdgeInsets.only(
        top: 16.px,
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
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 16.px,
                  left: 16.px,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 15.px,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff222222),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(left: 16.px, right: 16.px),
            child: child,
          )
        ],
      ),
    );
  }
}
