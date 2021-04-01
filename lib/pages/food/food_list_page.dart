import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/common/api/food.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class FoodListPage extends StatefulWidget {
  String foodType;
  String title;

  FoodListPage({
    @required this.foodType,
    @required this.title,
  });

  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  ScrollController _scrollController;
  Timer _timer;
  Duration _durationTime = Duration(milliseconds: 400);
  List<Foods> _foodList;
  bool _loadingFlag = false;
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.px,
          ),
        ),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: RefreshIndicator(
        color: Theme.of(context).primaryColor,
        onRefresh: _refreshData,
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: GlowingOverscrollIndicator(
            color: Theme.of(context).primaryColor,
            axisDirection: AxisDirection.down,
            child: _foodList == null
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
                    itemCount: _foodList.length,
                    itemBuilder: (context, index) {
                      // 如果是最后一个widget，则在后面额外添加一个loading
                      if (index == _foodList.length - 1) {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FoodItem(food: _foodList[index]),
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
                        return FoodItem(food: _foodList[index]);
                      }
                    },
                  ),
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
  }

  // 下拉刷新
  Future<void> _refreshData() async {
    await Future.delayed(Duration(milliseconds: 500));
    FoodList foodListResult = await FoodApi.getFoodList(widget.foodType, 1);

    if (foodListResult.code == 200) {
      setState(() {
        _foodList = foodListResult.data.foods;
      });
    } else {
      Toast.show('获取失败', offset: 128.px);
      setState(() {
        _foodList = null;
        _initPage();
      });
    }
  }

  Future<void> _loadingData() async {
    int page = _page + 1;

    if (page > 50) {
      Toast.show('已经到最底了');
      return;
    }
    FoodList foodListResult = await FoodApi.getFoodList(widget.foodType, 1);
    Iterable<Foods> foodData = List.generate(foodListResult.data.foods.length,
        (index) => foodListResult.data.foods[index]);
    if (foodListResult.code == 200) {
      setState(() {
        _foodList.addAll(foodData);
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
    FoodList foodListResult = await FoodApi.getFoodList(widget.foodType, 1);
    if (foodListResult.code == 200) {
      setState(() {
        _foodList = foodListResult.data.foods;
      });
    } else {
      setState(() {
        _foodList = [];
      });
      Toast.show('请求数据失败', offset: 128.px);
    }
    return null;
  }
}
