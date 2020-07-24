import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/utils/parse_date.dart';
import 'package:flutter/material.dart';

import '../row_stars.dart';
import 'genres_wrap_list.dart';
import 'movie_cast_container.dart';

class DetailsMovie extends StatelessWidget {
  const DetailsMovie({
    Key key,
    this.movie,
    this.topPadding,
  }) : super(key: key);

  final Movie movie;
  final double topPadding;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.only(top: topPadding),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RichText(
              text: TextSpan(
                  text: "Valoración",
                  style: TextStyle(
                    fontFamily: "Jost",
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  children: [TextSpan(text: " ${movie.voteAverage}")]),
            ),
            RowStars(
              size: 15,
              stars: movie.voteAverage,
              color: Colors.yellowAccent,
            ),
            SizedBox(height: 10.0),
            Text(
              "Generos",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
            SizedBox(height: 3.0),
            GenresWrapList(genresId: movie.genreIds),
            SizedBox(height: 10.0),
            Text(
              "Sinopsis",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 15),
            ),
            Text(
              movie.overview,
              style: TextStyle(color: Colors.white70, fontSize: 15.0),
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: "Fecha de estreno\n",
                      style: TextStyle(
                          fontFamily: "Jost",
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                      children: [
                        TextSpan(
                            text: convertTextDate(movie.releaseDate),
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                                fontSize: 14))
                      ]),
                ),
                SizedBox(width: 30.0),
                RichText(
                  text: TextSpan(
                      text: "Votos\n",
                      style: TextStyle(
                          fontFamily: "Jost",
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 15),
                      children: [
                        TextSpan(
                            text: movie.voteCount.toString(),
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w400,
                                fontSize: 14))
                      ]),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              "Elenco",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0),
            ),
            Container(
              height: 220,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 5.0),
              padding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
              decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20.0)),
              child: MovieCastContainer(movie: movie),
            )
          ],
        ),
      ),
    );
  }
}