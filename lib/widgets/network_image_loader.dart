import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class NetworkImageLoader extends StatelessWidget {
  final String url;
  final double borderRadiusSize;

  const NetworkImageLoader({this.url, this.borderRadiusSize});
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadiusSize),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
