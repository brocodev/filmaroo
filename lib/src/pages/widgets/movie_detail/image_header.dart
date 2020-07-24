import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ImageHeader extends StatelessWidget {
  const ImageHeader({
    Key key,
    @required this.imageUrl,
    @required this.heightCard,
  }) : super(key: key);

  final String imageUrl;
  final double heightCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          height: heightCard,
          width: double.infinity),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor,
            blurRadius: 15,
            offset: Offset(-1, 20.0),
          ),
        ],
      ),
    );
  }
}