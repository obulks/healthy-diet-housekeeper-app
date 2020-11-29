import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class _CustomNineGridView extends StatelessWidget {
  final List<String> urlList;

  const _CustomNineGridView({this.urlList});

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    return NineGridView(
      width: 343.px,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(8),
      space: 4.px,
      type: NineGridType.weiBo,
      itemCount: urlList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: NetworkImageLoader(
            url: urlList[index],
            borderRadiusSize: 4.px,
          ),
        );
      },
    );
  }
}