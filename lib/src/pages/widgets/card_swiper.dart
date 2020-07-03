import 'package:filmaroo/src/models/movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'card_image.dart';

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
                  child: _CardInfo(itemWidth: itemWidth, item: itemList[index]))
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

class _CardInfo extends StatelessWidget {
  const _CardInfo({
    Key key,
    @required this.itemWidth,
    @required this.item,
  }) : super(key: key);

  final double itemWidth;
  final Movie item;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            colors: [
              Colors.black45,
              Colors.transparent,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.center,
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: itemWidth * .74,
            child: RichText(
              softWrap: false,
              text: TextSpan(
                  text: item.title,
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontFamily: "Jost"),
                  children: [
                    TextSpan(
                        text: "\nVotos ${item.voteCount}",
                        style: TextStyle(
                            fontSize: 12.0, fontWeight: FontWeight.w300))
                  ]),
            ),
          ),
          Expanded(child: SizedBox()),
          Text(
            item.voteAverage.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.yellow,
            size: 16,
          )
        ],
      ),
    );
  }
}
