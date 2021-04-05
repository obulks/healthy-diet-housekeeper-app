import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class RecordPanel extends StatefulWidget {
  RecordPanel({
    @required this.food,
  });

  final Foods food;
  @override
  _RecordPanelState createState() => _RecordPanelState();
}

class _RecordPanelState extends State<RecordPanel> {
  List<String> _number;
  bool _pointClicked;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Material(
      type: MaterialType.transparency, //透明类型
      child: Stack(children: [
        Positioned(
          bottom: 32.px,
          left: 16.px,
          right: 16.px,
          child: Container(
            width: 345.px,
            height: 400.px,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: EdgeInsets.all(16.px),
                          child: Text(
                            '确认',
                            style: TextStyle(
                              fontSize: 16.px,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        onTap: () {
                          print('ok');
                        },
                      ),
                      Container(
                        child: Text(
                          '${DateTime.now().month}月${DateTime.now().day}日/早餐',
                          style: TextStyle(
                            fontSize: 16.px,
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          padding: EdgeInsets.all(16.px),
                          child: Text(
                            '取消',
                            style: TextStyle(
                              fontSize: 16.px,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        onTap: () {
                          print('ok');
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 128.px,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: 3,
                      ),
                    ),
                  ),
                  child: Text(
                    '${_number.join('')}',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 40.px,
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          _NumberButton(
                            text: '1',
                            onClick: () {
                              _pushNumber('1');
                            },
                          ),
                          _NumberButton(
                            text: '2',
                            onClick: () {
                              _pushNumber('2');
                            },
                          ),
                          _NumberButton(
                            text: '3',
                            onClick: () {
                              _pushNumber('3');
                            },
                          ),
                        ],
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          _NumberButton(
                            text: '4',
                            onClick: () {
                              _pushNumber('4');
                            },
                          ),
                          _NumberButton(
                            text: '5',
                            onClick: () {
                              _pushNumber('5');
                            },
                          ),
                          _NumberButton(
                            text: '6',
                            onClick: () {
                              _pushNumber('6');
                            },
                          ),
                        ],
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          _NumberButton(
                            text: '7',
                            onClick: () {
                              _pushNumber('7');
                            },
                          ),
                          _NumberButton(
                            text: '8',
                            onClick: () {
                              _pushNumber('8');
                            },
                          ),
                          _NumberButton(
                            text: '9',
                            onClick: () {
                              _pushNumber('9');
                            },
                          ),
                        ],
                      ),
                      Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          _NumberButton(
                            text: '·',
                            onClick: () {
                              _pointClick();
                            },
                          ),
                          _NumberButton(
                            text: '0',
                            onClick: () {
                              _pushNumber('0');
                            },
                          ),
                          _NumberButton(
                            text: '←',
                            onClick: () {
                              _popNumber();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    _number = ['0.0'];
    _pointClicked = false;
  }

  void _initNumber() {
    setState(() {
      _number = ['0.0'];
    });
  }

  void _pushNumber(String num) {
    setState(() {
      _number.add(num);
    });
  }

  void _popNumber() {

  }

  void _pointClick() {

  }
}

class _NumberButton extends StatelessWidget {
  _NumberButton({
    this.onClick,
    this.text,
  });

  final VoidCallback onClick;
  final String text;

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: 48.px,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24.px,
              fontWeight: FontWeight.bold,
            ),
          ),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xffcccccc).withOpacity(.4),
                width: 1,
              ),
              right: BorderSide(
                color: Color(0xffcccccc).withOpacity(.4),
                width: 1,
              ),
            ),
          ),
        ),
        onTap: onClick,
      ),
    );
  }
}
