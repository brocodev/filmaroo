import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/provider/movie_provider.dart';
import 'package:flutter/material.dart';
import 'card_swiper.dart';

class MoviesSwiperBuilder extends StatelessWidget {
  const MoviesSwiperBuilder({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: MovieProvider.getNowPlaying(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CardSwiper(itemList: snapshot.data);
          }
          return Center(
              child: SizedBox(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    strokeWidth: 6.0,
                  )));
        });
  }
}
