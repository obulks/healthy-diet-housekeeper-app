import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class UserBar extends StatelessWidget {
  final String avatarUrl;
  final String username;
  final Function onTap;

  UserBar(
      {@required this.avatarUrl,
      @required this.username,
      @required this.onTap});

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Container(
      child: Row(
        children: [
          Container(
            width: 50.px,
            height: 50.px,
            child: LoadNetworkImage(
              url: avatarUrl,
              borderRadiusSize: 64 / 2.px,
            ),
          ),
          SizedBox(
            width: 14.px,
          ),
          Container(
            child: Text(
              '$username',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.px,
                fontWeight: FontWeight.w500,
                letterSpacing: .8.px,
              ),
            ),
          ),
          SizedBox(
            width: 4.px,
          ),
          Container(
            child: GestureDetector(
              child: Icon(
                Icons.border_color,
                color: Colors.white,
                size: 12.px,
              ),
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
