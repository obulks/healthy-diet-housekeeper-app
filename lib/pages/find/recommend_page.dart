import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class RecommendPage extends StatefulWidget {
  @override
  _RecommendPageState createState() => _RecommendPageState();
}

class _RecommendPageState extends State<RecommendPage> {
  ScrollController _scrollController;
  Timer _timer;
  Duration _durationTime = Duration(milliseconds: 400);
  List<int> _dataList;
  bool _loadingFlag = false;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      floatingActionButton: Container(
        width: 48.px,
        height: 48.px,
        child: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Container(
            child: Icon(
              Icons.edit,
            ),
          ),
          onPressed: () {},
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: MyScrollConfiguration(
          child: ListView.builder(
            controller: _scrollController,
            physics: ClampingScrollPhysics(),
            itemCount: _dataList.length,
            itemBuilder: (context, index) {
              // 如果是最后一个widget，则在后面额外添加一个loading
              if (index == _dataList.length - 1) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PostCard(),
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
                return PostCard();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    _scrollController = new ScrollController();
    _dataList = List.generate(5, (i) => i);

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
    _timer = Timer(_durationTime, () {
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
    _dataList = List.generate(10, (index) => index + 100);
    setState(() {});
  }

  Future<void> _loadingData() async {
    print('上拉加载');
    await Future.delayed(Duration(milliseconds: 500));
    var newData = List.generate(5, (index) => index + 900);
    _dataList.addAll(newData);
    setState(() {});
  }
}
