import 'package:filmaroo/src/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import '../card_image.dart';
import '../card_info.dart';

class CardSwiper extends StatelessWidget {
  const CardSwiper({
    Key key,
    this.itemList,
  }) : super(key: key);

  final List<Movie> itemList;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final itemWidth = size.width * .6;

    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        final imageUrl = itemList[index].getPosterImagePath();
        itemList[index].uniqueId = "${itemList[index].id}-swipper";
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Hero(
                tag: itemList[index].uniqueId,
                child: CardImage(imageUrl: imageUrl),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, 'detail',
                        arguments: itemList[index]);
                  },
                  child: CardInfo(itemWidth: itemWidth, item: itemList[index]))
            ],
          ),
        );
      },
      itemCount: itemList.length,
      itemWidth: itemWidth,
      viewportFraction: .67,
      scale: .75,
    );
  }
}
