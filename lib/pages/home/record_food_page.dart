import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class RecordFoodPage extends StatefulWidget {
  RecordFoodPage({this.title});

  final String title;
  @override
  _RecordFoodPageState createState() => _RecordFoodPageState();
}

class _RecordFoodPageState extends State<RecordFoodPage> {
  List<Foods> _foodList = [];
  Timer _timer;
  Duration _durationTime = Duration(milliseconds: 500);
  ScrollController _scrollController = new ScrollController();
  Duration _scrollDurationTime = Duration(milliseconds: 1000);
  // 用来判断搜索是否有结果
  bool _searchResult = true;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        title: Text(
          '记${widget.title}' ?? '记饮食',
          style: TextStyle(
            color: Colors.white,
            fontSize: 19.px,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(top: 16.px, bottom: 16.px),
            child: SearchBar(
              hintText: '请输入食物名称',
              onSearch: _onSearch,
              onChanged: _onChange,
              onClear: _onClear,
            ),
          ),
          Divider(
            height: 0,
          ),
          Expanded(
            child: MyScrollConfiguration(
              child: Container(
                padding: EdgeInsets.only(top: 16.px),
                child: _foodList.length == 0
                    ? () {
                        if (_searchResult) {
                          return Container();
                        } else {
                          // 如果搜索失败则显示提示
                          return Container(
                            alignment: Alignment.topCenter,
                            padding: EdgeInsets.only(top: 64.px),
                            child: Text('暂无内容'),
                          );
                        }
                      }()
                    : ListView.builder(
                        shrinkWrap: true,
                        controller: _scrollController,
                        itemCount: _foodList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RecordSearchItem(food: _foodList[index]);
                        },
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void dispose() {
    super.dispose();
    _timer?.cancel();
    _scrollController.dispose();
  }

  _scrollListener() {
    // 有待优化，应该使用一个立即执行的防抖函数
    FocusScope.of(context).requestFocus(FocusNode());
  }

  _onSearch(value) {
    print(value);
  }

  _onChange(value) {
    if (value == '') {
      setState(() {
        _foodList = [];
        _searchResult = true;
        _timer?.cancel();
      });
    } else {
      // 对请求进行防抖处理
      _timer?.cancel();
      _timer = Timer(_durationTime, () async {
        _fetch(value);
      });
    }
  }

  _fetch(String word) async {
    if (word == '') {
      return;
    }
    print('fetch');
    FoodList foodListResult = await FoodApi.searchFood(word);
    if (foodListResult.code == 200) {
      print(foodListResult.data.foods[0].toJson());
      setState(() {
        _foodList = foodListResult.data.foods;
      });
    } else {
      setState(() {
        _foodList = [];
        _searchResult = false;
      });
    }
  }

  void _onClear() {
    setState(() {
      _foodList = [];
      _searchResult = true;
      _timer?.cancel();
    });
  }
}
