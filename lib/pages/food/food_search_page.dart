import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/pages/food/search_item.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class FoodSearchPage extends StatefulWidget {
  @override
  _FoodSearchPageState createState() => _FoodSearchPageState();
}

class _FoodSearchPageState extends State<FoodSearchPage> {
  List<Foods> _foodList = [];
  Timer _timer;
  Duration _durationTime = Duration(milliseconds: 500);
  // 用来判断搜索是否有结果
  bool _searchResult = true;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: AppBarSearch(
          hintText: '请输入食物名称',
          onSearch: _onSearch,
          onChanged: _onChange,
          onClear: _onClear,
        ),
        body: MyScrollConfiguration(
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
                    itemCount: _foodList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SearchItem(food: _foodList[index]);
                    },
                  ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
    _timer?.cancel();
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
      // 请求防抖
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
      _searchResult = true;
    });
  }
}
