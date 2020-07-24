import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/pages/widgets/card_image.dart';
import 'package:flutter/material.dart';
import 'row_stars.dart';


class CardMovie extends StatelessWidget {
  const CardMovie({
    Key key,
    @required this.itemHeight,
    this.movie,
    this.itemWidth,
  }) : super(key: key);

  final double itemHeight;
  final double itemWidth;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    movie.uniqueId = "${movie.id}-card";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () =>
                Navigator.pushNamed(context, 'detail', arguments: movie),
            child: Hero(
              tag: movie.uniqueId,
              child: CardImage(
                imageUrl: movie.getPosterImagePath(),
                height: itemHeight * .75,
                width: itemWidth,
              ),
            ),
          ),
          RowStars(
            stars: movie.voteAverage,
            size: 12.0,
            color: Colors.orange,
          ),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
