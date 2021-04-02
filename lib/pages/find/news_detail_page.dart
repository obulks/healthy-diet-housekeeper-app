import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';
import 'package:healthy_diet_housekeeper/models/news_detail.dart';

class NewsDetailPage extends StatefulWidget {
  final String uniquekey;

  NewsDetailPage({
    @required this.uniquekey,
  });

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('demo'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<NewsDetail> snap) {
            if (snap.connectionState == ConnectionState.active ||
                snap.connectionState == ConnectionState.waiting) {
              return Container(
                padding: EdgeInsets.only(top: 20.px),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              );
            }
            if (snap.connectionState == ConnectionState.done) {
              if (snap.data.code == 400) {
                return Container(
                  child: Text(
                    '服务器暂查询不到此新闻详情，请过一段时间再来',
                  ),
                );
              }
              print(snap.data.data.detail);
              return Container(
                child: Html(
                  data: '''
                  <h2>${snap.data.data.detail.title}</h1>
                  ${snap.data.data.content}
                  ''',
                  style: {
                    'h2': Style(
                      textAlign: TextAlign.center,
                    ),
                    'p': Style(
                      // before: '&nbsp;&nbsp;',
                      lineHeight: LineHeight.number(1.5),
                    ),
                  },
                ),
              );
            }
            return CircularProgressIndicator();
          },
          future: _future(),
        ),
      ),
    );
  }

  Future<NewsDetail> _future() async {
    return await NewsApi.getContent(widget.uniquekey);
  }
}
