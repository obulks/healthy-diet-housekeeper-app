import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class FoodDetailPage extends StatelessWidget {
  FoodDetailPage({
    @required this.food,
  });

  final Foods food;

  @override
  Widget build(BuildContext context) {
    // 食物的宏量元素
    final num macronutrien = food.dbz + food.zf + food.shhf;
    final num dbzPercent = food.dbz / macronutrien;
    final num zfPercent = food.zf / macronutrien;
    final num shhfPercent = food.shhf / macronutrien;

    SizeFit.initialize(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.dark,
        title: Text(
          '${food.name}',
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
      body: MyScrollConfiguration(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                CustomCard(
                  title: '热量',
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${food.rl.toStringAsFixed(0)}',
                            style: TextStyle(
                              fontSize: 32.px,
                              height: 1,
                            ),
                          ),
                          SizedBox(
                            width: 8.px,
                          ),
                          Text(
                            '千卡',
                            style: TextStyle(
                              fontSize: 14.px,
                              height: 3,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.px,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '每100克（可食用部分）',
                            style: TextStyle(
                              fontSize: 11.px,
                              color: Colors.black26,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.px,
                      ),
                    ],
                  ),
                ),
                CustomCard(
                  title: '三大营养素',
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: 16.px, right: 16.px, top: 24.px),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 70.px,
                                  lineWidth: 5.px,
                                  percent: dbzPercent,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  backgroundColor: Color(0xfff5f4f4),
                                  progressColor:
                                      Color(0xfffeb377).withOpacity(.8),
                                  center: Text(
                                    '${(dbzPercent * 100).toStringAsFixed(0)}%',
                                  ),
                                ),
                                SizedBox(
                                  height: 8.px,
                                ),
                                Text(
                                  '蛋白质',
                                  style: TextStyle(
                                    fontSize: 11.px,
                                  ),
                                ),
                                Text(
                                  '${food.dbz}克',
                                  style: TextStyle(
                                    fontSize: 11.px,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 70.px,
                                  lineWidth: 5.px,
                                  percent: zfPercent,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  backgroundColor: Color(0xfff5f4f4),
                                  progressColor:
                                      Color(0xffff847c).withOpacity(.8),
                                  center: Text(
                                      '${(zfPercent * 100).toStringAsFixed(0)}%'),
                                ),
                                SizedBox(
                                  height: 8.px,
                                ),
                                Text(
                                  '脂肪',
                                  style: TextStyle(
                                    fontSize: 11.px,
                                  ),
                                ),
                                Text(
                                  '${food.zf}克',
                                  style: TextStyle(
                                    fontSize: 11.px,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircularPercentIndicator(
                                  radius: 70.px,
                                  lineWidth: 5.px,
                                  percent: shhfPercent,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  backgroundColor: Color(0xfff5f4f4),
                                  progressColor:
                                      Color(0xff7f78d2).withOpacity(.8),
                                  center: Text(
                                      '${(shhfPercent * 100).toStringAsFixed(0)}%'),
                                ),
                                SizedBox(
                                  height: 8.px,
                                ),
                                Text(
                                  '碳水化合物',
                                  style: TextStyle(
                                    fontSize: 11.px,
                                  ),
                                ),
                                Text(
                                  '${food.shhf}克',
                                  style: TextStyle(
                                    fontSize: 11.px,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16.px,
                      ),
                      Container(
                        width: 345.px,
                        padding: EdgeInsets.only(
                          top: 8.px,
                          left: 16.px,
                          right: 16.px,
                          bottom: 16.px,
                        ),
                        child: Text(
                          '注：以上为蛋白质、脂肪、碳水化合物三者的比例，并不是他们与总营养的占比。',
                          style: TextStyle(
                            fontSize: 11.px,
                            color: Colors.black26,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomCard(
                  title: '维生素',
                  child: Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Color(0xffcccccc),
                        width: 1.px,
                      ),
                    ),
                    children: [
                      TableRow(children: [
                        _CustomCellLeft('维生素A'),
                        _CustomCellLeft('${food.wssa}微克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('维生素B1'),
                        _CustomCellLeft('${food.su}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('维生素B2'),
                        _CustomCellLeft('${food.dgc}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('维生素B3'),
                        _CustomCellLeft('${food.ys}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('维生素C'),
                        _CustomCellLeft('${food.wsfc}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('维生素E'),
                        _CustomCellLeft('${food.wsse}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('胡萝卜素'),
                        _CustomCellLeft('${food.lb}微克'),
                      ]),
                    ],
                  ),
                ),
                CustomCard(
                  title: '矿物质',
                  child: Table(
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Color(0xffcccccc),
                        width: 1.px,
                      ),
                    ),
                    children: [
                      TableRow(children: [
                        _CustomCellLeft('钙'),
                        _CustomCellLeft('${food.gai}微克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('镁'),
                        _CustomCellLeft('${food.mei}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('铁'),
                        _CustomCellLeft('${food.tei}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('锰'),
                        _CustomCellLeft('${food.meng}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('锌'),
                        _CustomCellLeft('${food.xin}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('铜'),
                        _CustomCellLeft('${food.tong}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('钾'),
                        _CustomCellLeft('${food.jia}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('磷'),
                        _CustomCellLeft('${food.ling}毫克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('钠'),
                        _CustomCellLeft('${food.la}微克'),
                      ]),
                      TableRow(children: [
                        _CustomCellLeft('硒'),
                        _CustomCellLeft('${food.xi}微克'),
                      ]),
                    ],
                  ),
                ),
                SizedBox(height: 24.px),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _dataRows() {
    return <DataRow>[
      DataRow(
        cells: [
          DataCell(Text('name')),
          DataCell(Text('age')),
          DataCell(Text('2020')),
        ],
      )
    ];
  }
}

class _CustomCellLeft extends StatelessWidget {
  final String text;

  const _CustomCellLeft(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.px,
      alignment: Alignment.centerLeft,
      child: Text(
        text ?? '',
        style: TextStyle(
          fontSize: 13.px,
        ),
      ),
    );
  }
}
