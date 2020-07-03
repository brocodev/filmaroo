import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    Key key,
    @required this.imageUrl,
    this.height,
    this.width,
    this.colorShadow = const Color(0x10000000),
  }) : super(key: key);

  final String imageUrl;
  final double height;
  final double width;
  final Color colorShadow;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: colorShadow,
            blurRadius: 10,
            offset: Offset(-3, 3),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          height: height,
          width: width,
          placeholder: (context, string) => Image.asset(
            "assets/img/placeholder-image.jpg",
            fit: BoxFit.cover,
            height: height,
            width: width,
          ),
        ),
      ),
    );
  }

}
