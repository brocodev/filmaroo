import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/pages/widgets/card_image.dart';
import 'package:filmaroo/src/pages/widgets/row_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HorizontalMovieList extends StatelessWidget {
  final List<Movie> itemList;
  final double itemHeight;
  final double itemWith;

  const HorizontalMovieList({
    Key key,
    this.itemList,
    this.itemHeight,
    this.itemWith,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: itemHeight,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemList.length,
        itemExtent: itemWith,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return _CardMovie(
              itemHeight: itemHeight,
              itemWidth: itemWith,
              movie: itemList[index]);
        },
      ),
    );
  }
}

class _CardMovie extends StatelessWidget {
  const _CardMovie({
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
