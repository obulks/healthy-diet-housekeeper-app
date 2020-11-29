import 'package:flutter/material.dart';
import 'package:healthy_diet_housekeeper/public.dart';

class LoadNetworkImage extends StatelessWidget {
  final String url;
  final double borderRadiusSize;
  final Widget placeholder;
  final Widget errorWidget;

  const LoadNetworkImage({
    this.url,
    this.borderRadiusSize,
    this.placeholder,
    this.errorWidget,
  });
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
      placeholder: (context, url) =>
          placeholder ??
          SpinKitFadingCircle(
            color: Theme.of(context).primaryColor,
            size: 30.px,
          ),
      errorWidget: (context, url, error) => errorWidget ?? Icon(Icons.error),
    );
  }
}
