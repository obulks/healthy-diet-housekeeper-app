import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Card(
      elevation: 1,
      margin: EdgeInsets.all(8.px),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 8.px,
              left: 8.px,
            ),
            child: Row(
              children: [
                Container(
                  width: 40.px,
                  height: 40.px,
                  child: LoadNetworkImage(
                    url:
                        'http://i1.hdslb.com/bfs/face/681d4084f2e7e423fa188339c51a438c2eae59b2.jpg',
                    borderRadiusSize: 20.px,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.px),
                  child: Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 15.px,
                      // color: Color(0xff444444),
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
              top: 8.px,
              left: 8.px,
            ),
            child: Text(
              'Flutter是一个由谷歌开发的开源移动应用软件开发工具包，用于为Android、iOS、Windows、Mac、Linux、Google Fuchsia开发应用。\nFlutter第一个版本支持Android操作系统，开发代号称作“Sky”。\nFlutter是一个由谷歌开发的开源移动应用软件开发工具包，用于为Android、iOS、Windows、Mac、Linux、Google Fuchsia开发应用。 \nFlutter第一个版本支持Android操作系统，开发代号称作“Sky”。',
              style: TextStyle(
                fontSize: 14.px,
                height: 1.5,
                color: Color(0xff333E57),
              ),
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          // Container(
          //   child: CustomNineGridView(
          //     urls: [
          //       'https://gitee.com/obulks/public/raw/master/lobby/beijing_aiai.jpg',
          //       'https://gitee.com/obulks/public/raw/master/lobby/beijing_aiai.jpg',
          //       'https://gitee.com/obulks/public/raw/master/lobby/beijing_aiai.jpg',
          //     ],
          //   ),
          // ),
          Container(
            padding: EdgeInsets.all(8.px),
            child: FittedBox(
              child: NineOldWidget(
                images: [
                  'https://gitee.com/obulks/public/raw/master/lobby/beijing_aiai.jpg',
                  'https://gitee.com/obulks/public/raw/master/lobby/beijing_aiai.jpg',
                  'https://gitee.com/obulks/public/raw/master/lobby/beijing_aiai.jpg',
                  'https://gitee.com/obulks/public/raw/master/lobby/beijing_aiai.jpg',
                  'https://gitee.com/obulks/public/raw/master/lobby/beijing_aiai.jpg',
                ],
              ),
            ),
          ),
          Container(
            height: 32.px,
            padding: EdgeInsets.only(left: 32.px, right: 32.px),
            margin: EdgeInsets.only(bottom: 8.px),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up_outlined),
                    SizedBox(width: 4.px),
                    Text('88'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.message_outlined),
                    SizedBox(width: 4.px),
                    Text('88'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star_outline),
                    SizedBox(width: 4.px),
                    Text('88'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
