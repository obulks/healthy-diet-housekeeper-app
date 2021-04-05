import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class RecordFoodButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final String subTitle;
  final Widget icon;
  final Widget tailIcon;

  RecordFoodButton({
    this.title,
    this.subTitle,
    this.icon,
    this.tailIcon,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Container(
      width: 345.px,
      height: 64.px,
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
            offset: Offset(0, 2),
            blurRadius: 1,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40.px,
                    height: 40.px,
                    margin: EdgeInsets.only(left: 16.px),
                    child: icon,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16.px),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$title',
                          style: TextStyle(
                            fontSize: 13.px,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.px),
                        Text(
                          '$subTitle',
                          style: TextStyle(
                            fontSize: 12.px,
                            color: Color(0xff999999),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    child: tailIcon ??
                        Icon(
                          Icons.add,
                          color: Colors.black54,
                        ),
                    margin: EdgeInsets.only(
                      right: 16.px,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
