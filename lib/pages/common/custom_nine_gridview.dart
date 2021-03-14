import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class CustomNineGridView extends StatelessWidget {
  final List<String> urls;
  final double width;
  final double borderRadiusSize;
  final double space;

  const CustomNineGridView({
    @required this.urls,
    this.width,
    this.borderRadiusSize,
    this.space,
  });

  @override
  Widget build(BuildContext context) {
    SizeFit.initialize(context);
    switch (urls.length) {
      case 0:
        return SizedBox.shrink();
      case 1:
        return _buildSingleImage(context);
      case 9:
        return _buildNineImages(context);
      default:
        return _buildNineImages(context);
    }
  }
  Widget _buildSingleImage(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.px),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: LoadNetworkImage(
          url: urls[0],
          borderRadiusSize: borderRadiusSize ?? 4.px,
        ),
      ),
    );
  }
  Widget _buildNineOldWidget(BuildContext context) {
    return NineOldWidget(images: urls);
  }

  Widget _buildNineImages(BuildContext context) {
    return NineGridView(
      width: width ?? 343.px,
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.all(8),
      space: space ?? 4.px,
      type: NineGridType.weiBo,
      itemCount: urls.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          child: LoadNetworkImage(
            url: urls[index],
            borderRadiusSize: borderRadiusSize ?? 4.px,
          ),
        );
      },
    );
  }
}
