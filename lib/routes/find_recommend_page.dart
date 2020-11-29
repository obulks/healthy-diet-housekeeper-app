import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:healthy_diet_housekeeper/widgets/network_image_loader.dart';
import '../common/size_fit.dart';
import '../common/int_extension.dart';
import '../common/double_extension.dart';

import 'package:nine_grid_view/nine_grid_view.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  ScrollController _scrollController;
  Timer _timer;
  Duration durationTime = Duration(milliseconds: 400);
  List<int> _dataList;
  bool _loadingFlag = false;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: _refreshData,
      child: ListView.builder(
        controller: _scrollController,
        physics: BouncingScrollPhysics(),
        itemCount: _dataList.length,
        itemBuilder: (context, index) {
          // 如果是最后一个widget，则在后面额外添加一个loading
          if (index == _dataList.length - 1) {
            return Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ItemCard(),
                  Center(
                    child: Opacity(
                      opacity: _loadingFlag ? 0 : 1,
                      child: SpinKitThreeBounce(
                        color: Theme.of(context).primaryColor,
                        size: 24.px,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return _ItemCard();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    _scrollController = new ScrollController();
    _dataList = List.generate(30, (i) => i);

    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  _scrollListener() {
    // 上拉加载防抖
    _timer?.cancel();
    _timer = Timer(durationTime, () {
      // 可滚动的最大距离
      double maxScrollExtent = _scrollController.position.maxScrollExtent;
      // 当前滚动的位置
      double offset = _scrollController.position.pixels;

      // 滚动到底部
      if (offset >= maxScrollExtent) {
        setState(() {
          _loadingFlag = true;
        });
        _loadingData();
        setState(() {
          _loadingFlag = false;
        });
      } else {
        setState(() {
          _loadingFlag = false;
        });
      }
    });
  }

  Future<void> _refreshData() async {
    print('下拉刷新');
    await Future.delayed(Duration(milliseconds: 500));
    _dataList.clear();
    _dataList = List.generate(30, (index) => index + 100);
    setState(() {});
  }

  Future<void> _loadingData() async {
    print('上拉加载');
    await Future.delayed(Duration(milliseconds: 500));
    var newData = List.generate(20, (index) => index + 900);
    _dataList.addAll(newData);
    setState(() {});
  }
}

class _ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  child: CachedNetworkImage(
                    imageUrl:
                        'http://i1.hdslb.com/bfs/face/681d4084f2e7e423fa188339c51a438c2eae59b2.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      width: 40.px,
                      height: 40.px,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    placeholder: (context, url) => SpinKitFadingCircle(
                      color: Theme.of(context).primaryColor,
                      size: 30.px,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
          Container(
            // decoration: BoxDecoration(
            //   border: Border(
            //     bottom: BorderSide(
            //       width: 1.px,
            //       color: Color(0xffe5e5e5),
            //     ),
            //   ),
            // ),
            child: NineGridView(
              width: 343.px,
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.all(8),
              space: 4.px,
              type: NineGridType.weiBo,
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://gitee.com/obulks/public/raw/master/lobby/beijing_aiai.jpg',
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.px),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}



