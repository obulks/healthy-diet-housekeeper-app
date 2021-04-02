import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class FoodGroupPanel extends StatelessWidget {
  // 每个子列表第一项为显示在前端的文本，第二项为查询时需要的食品类型关键字
  final List<List<String>> foodGroups = [
    ['谷类', '谷类'],
    ['薯类', '薯类淀粉'],
    ['豆类', '干豆类'],
    ['蔬菜', '蔬菜类'],
    ['菌类', '菌藻类'],
    ['藻类', '菌藻类'],
    ['水果', '水果类'],
    ['坚果', '坚果种子'],
    ['畜肉', '畜肉类'],
    ['禽肉', '禽肉类'],
    ['乳类', '乳类'],
    ['蛋类', '蛋类'],
    ['河海鲜', '鱼虾蟹贝'],
    ['饮料', '软饮料'],
    ['酒类', '酒精饮料'],
    ['油类', '油脂类'],
    ['调味品', '调味品类'],
    ['小吃甜饼', '小吃甜饼'],
  ];

  List<Image> icons;

  _initResources() {
    icons = [
      Image.asset('assets/icons/food_group/1gulei.png',
          width: 22.px, height: 22.px),
      Image.asset('assets/icons/food_group/2shulei.png',
          width: 26.px, height: 26.px),
      Image.asset('assets/icons/food_group/3doulei.png',
          width: 32.px, height: 32.px),
      Image.asset('assets/icons/food_group/4shucai.png',
          width: 24.px, height: 24.px),
      Image.asset('assets/icons/food_group/5junlei.png',
          width: 24.px, height: 24.px),
      Image.asset('assets/icons/food_group/6zaolei.png',
          width: 30.px, height: 30.px),
      Image.asset('assets/icons/food_group/7shuiguo.png',
          width: 22.px, height: 22.px),
      Image.asset('assets/icons/food_group/8jianguo.png',
          width: 28.px, height: 28.px),
      Image.asset('assets/icons/food_group/9churou.png',
          width: 22.px, height: 22.px),
      Image.asset('assets/icons/food_group/10qinrou.png',
          width: 28.px, height: 28.px),
      Image.asset('assets/icons/food_group/11rulei.png',
          width: 26.px, height: 26.px),
      Image.asset('assets/icons/food_group/12danlei.png',
          width: 26.px, height: 26.px),
      Image.asset('assets/icons/food_group/13hehaixian.png',
          width: 30.px, height: 30.px),
      Image.asset('assets/icons/food_group/14chalei.png',
          width: 24.px, height: 24.px),
      Image.asset('assets/icons/food_group/15jiulei.png',
          width: 24.px, height: 24.px),
      Image.asset('assets/icons/food_group/16youlei.png',
          width: 24.px, height: 24.px),
      Image.asset('assets/icons/food_group/17tiaoweipinglei.png',
          width: 24.px, height: 24.px),
      Image.asset('assets/icons/food_group/18lingshiyinliao.png',
          width: 24.px, height: 24.px),
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    _initResources();
    return Container(
      height: 680.px,
      margin: EdgeInsets.all(16.px),
      padding: EdgeInsets.all(16.px),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xffcccccc),
              offset: Offset(0, 0),
              blurRadius: 1.px,
            ),
          ],
          borderRadius: BorderRadius.circular(4.px)),
      child: Column(
        children: [
          Text(
            '食物分类',
            style: TextStyle(
              fontSize: 13.px,
              fontWeight: FontWeight.w500,
              color: Color(0xff222222),
            ),
          ),
          SizedBox(height: 4.px),
          Divider(),
          SizedBox(height: 4.px),
          Expanded(
            child: GridView.count(
              // scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 24.px,
              mainAxisSpacing: 16.px,
              children: List.generate(
                foodGroups.length,
                (index) {
                  return GestureDetector(
                    onTap: () => _toFoodListPage(
                        context, foodGroups[index][0], foodGroups[index][1]),
                    child: Container(
                      child: Column(
                        children: [
                          Container(
                            width: 48.px,
                            height: 48.px,
                            alignment: Alignment(0, 0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100.px),
                              border: Border.all(
                                color: Color(0xffcccccc).withOpacity(.4),
                              ),
                            ),
                            child: icons[index],
                          ),
                          SizedBox(
                            height: 4.px,
                          ),
                          Text(
                            '${foodGroups[index][0]}',
                            style: TextStyle(
                              fontSize: 13.px,
                              color: Color(0xff222222),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  _toFoodListPage(BuildContext context, String title, String foodType) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodListPage(
          foodType: foodType,
          title: title,
        ),
      ),
    );
  }
}
