import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class FoodItem extends StatelessWidget {
  FoodItem({
    @required this.food,
  });

  final Foods food;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(top: 8.px, left: 8.px, right: 8.px),
        width: double.infinity,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    food.name,
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.px,
                    ),
                  ),
                  SizedBox(
                    height: 4.px,
                  ),
                  Text(
                    '${food.rl} 千卡',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12.px,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 8.px),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.black54,
                size: 20.px,
              ),
            ),
          ],
        ),
      ),
      onTap: () => _toFoodDetail(),
    );
  }

  _toFoodDetail() {
  }
}
