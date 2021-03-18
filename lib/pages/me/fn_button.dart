import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class FnButton extends StatelessWidget {
  final Widget icon;
  final String title;
  final Function onTap;

  const FnButton({
    Key key,
    @required this.icon,
    @required this.title,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: icon,
            ),
            SizedBox(
              height: 4.px,
            ),
            Text(
              title,
              style: TextStyle(
                color: Color(0xff333E57),
                fontSize: 12.px,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
