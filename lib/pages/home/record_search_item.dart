import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class RecordSearchItem extends StatelessWidget {
  RecordSearchItem({
    @required this.food,
  });

  final Foods food;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => _showDialog(context, food),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(left: 16.px, right: 16.px),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              food.name,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14.px,
              ),
            ),
            Text(
              '${food.rl} 千卡',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 11.px,
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  _showDialog(BuildContext context, Foods food) {
    showDialog(
      context: context,
      builder: (BuildContext context) => RecordPanel(food: food,),
    );
  }
}
