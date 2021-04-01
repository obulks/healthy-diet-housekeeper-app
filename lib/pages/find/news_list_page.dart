import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  ScrollController _scrollController;
  Timer _timer;
  Duration _durationTime = Duration(milliseconds: 400);
  List<News> _newsList;
  bool _loadingFlag = false;
  int _page = 1;
  int _pageSize = 30;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return RefreshIndicator(
      color: Theme.of(context).primaryColor,
      onRefresh: _refreshData,
      child: ScrollConfiguration(
        behavior: ScrollBehavior(),
        child: GlowingOverscrollIndicator(
          color: Theme.of(context).primaryColor,
          axisDirection: AxisDirection.down,
          child: _newsList == null
              ? Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : ListView.builder(
                  controller: _scrollController,
                  physics: ClampingScrollPhysics(),
                  itemCount: _newsList.length,
                  itemBuilder: (context, index) {
                    // 如果是第一个widget添加顶部padding
                    if (index == 0) {
                      return Padding(
                        padding: EdgeInsets.only(top: 8.px),
                        child: NewsItem(_newsList[index]),
                      );
                    }
                    // 如果是最后一个widget，则在后面额外添加一个loading
                    if (index == _newsList.length - 1) {
                      return Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NewsItem(_newsList[index]),
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
                      return NewsItem(_newsList[index]);
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
    // _newsList = List.generate(15, (news) => News());
    _fetch();

    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  _initPage() {
    _page = 1;
    _pageSize = 30;
  }

  bool _equality(List list1, List list2) {
    Iterable<News> elements1 =
        List.generate(_pageSize, (index) => list1[index]);
    Iterable<News> elements2 =
        List.generate(_pageSize, (index) => list2[index]);

    if (IterableEquality().equals(elements1, elements2)) {
      return true;
    } else {
      return false;
    }
  }

  // 下拉刷新
  Future<void> _refreshData() async {
    await Future.delayed(Duration(milliseconds: 500));
    NewsList newsListResult = await NewsApi.getNewsList(_page, _pageSize);

    if (newsListResult.code == 200) {
      // 如果获取的数据与原来的一样则提示用户
      if (_equality(_newsList, newsListResult.data.news)) {
        Toast.show('已是最新', offset: 128.px);
        return;
      }
      setState(() {
        _newsList = newsListResult.data.news;
      });
    } else {
      Toast.show('获取失败', offset: 128.px);
      setState(() {
        _newsList = null;
        _initPage();
      });
    }
  }

  // 上拉加载更多
  Future<void> _loadingData() async {
    int page = _page + 1;
    int pageSize = _pageSize;

    if (page > 50) {
      Toast.show('已经到最底了');
      return;
    }
    NewsList newsListResult = await NewsApi.getNewsList(page, pageSize);
    Iterable<News> newData =
        List.generate(pageSize, (index) => newsListResult.data.news[index]);
    if (newsListResult.code == 200) {
      setState(() {
        _newsList.addAll(newData);
        _page += 1;
      });
    } else {
      Toast.show('请求数据失败', offset: 128.px);
    }
  }

  // 上拉加载防抖
  _scrollListener() {
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

  _fetch() async {
    NewsList newsListResult = await NewsApi.getNewsList(_page, _pageSize);
    if (newsListResult.code == 200) {
      setState(() {
        _newsList = newsListResult.data.news;
      });
    } else {
      setState(() {
        _newsList = [];
      });
      Toast.show('请求数据失败', offset: 128.px);
    }
    return null;
  }
}
