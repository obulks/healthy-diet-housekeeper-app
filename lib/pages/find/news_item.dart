import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class NewsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Container(
      padding: EdgeInsets.only(left: 16.px, right: 16.px),
      // height: 100.px,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 250.px,
                      child: Text(
                        '关于大豆油有害的“网传观点” 你信吗？',
                        style: TextStyle(
                          fontSize: 14.px,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 4.px,),
                    Container(
                      child: Text(
                        '网易健康',
                        style: TextStyle(
                          fontSize: 11.px,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(height: 4.px,),
                    Container(
                      child: Text(
                        '2021-3-20 07:00',
                        style: TextStyle(
                          fontSize: 11.px,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 85.px,
                height: 64.px,
                child: LoadNetworkImage(
                  url:
                      'http://cms-bucket.ws.126.net/2021/0311/8aa4d1c6p00qpt71a004ec0009c0070c.png?imageView&thumbnail=150y100',
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
