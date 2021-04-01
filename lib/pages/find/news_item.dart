import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class NewsItem extends StatelessWidget {
  final News news;

  const NewsItem(
    this.news,
  );

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return GestureDetector(
      onTap: () {
        print(news.uniquekey);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(
              uniquekey: news.uniquekey,
            ),
          ),
        );
      },
      child: Container(
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
                          '${news.title}',
                          style: TextStyle(
                            fontSize: 14.px,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 4.px,
                      ),
                      Container(
                        child: Text(
                          '${news.authorName}',
                          style: TextStyle(
                            fontSize: 11.px,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.px,
                      ),
                      Container(
                        child: Text(
                          '${news.date}',
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
                    url: '${news.thumbnailPicS}',
                  ),
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
