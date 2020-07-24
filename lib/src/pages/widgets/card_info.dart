import 'package:filmaroo/src/models/movie.dart';
import 'package:flutter/material.dart';


class CardInfo extends StatelessWidget {
  const CardInfo({
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
