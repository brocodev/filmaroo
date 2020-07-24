import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/pages/widgets/card_movie.dart';
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
          return CardMovie(
              itemHeight: itemHeight,
              itemWidth: itemWith,
              movie: itemList[index]);
        },
      ),
    );
  }
}
