import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/pages/widgets/card_image.dart';
import 'file:///C:/Users/Kevin/Documents/Projects/flutter/filmaroo/lib/src/pages/widgets/movie_detail/genres_wrap_list.dart';
import 'file:///C:/Users/Kevin/Documents/Projects/flutter/filmaroo/lib/src/pages/widgets/movie_detail/movie_cast_container.dart';
import 'package:filmaroo/src/pages/widgets/row_stars.dart';
import 'package:filmaroo/src/utils/parse_date.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context).settings.arguments;
    final size = MediaQuery.of(context).size;
    final heightCard = size.height * .32;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _BackgroundPage(),
          _BodyItems(movie: movie, topPadding: heightCard),
          _ImageHeader(
              imageUrl: movie.getBackdropImagePath(), heightCard: heightCard),
          _ShaderMaskCard(heightCard: heightCard),
          _PosterMovieCard(
            imageUrl: movie.getPosterImagePath(),
            size: size,
            heroTag: movie.uniqueId,
          ),
          _TitleMovie(title: movie.title),
        ],
      ),
    );
  }
}

class _BodyItems extends StatelessWidget {
  const _BodyItems({
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

class _ImageHeader extends StatelessWidget {
  const _ImageHeader({
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

class _PosterMovieCard extends StatelessWidget {
  const _PosterMovieCard({
    Key key,
    @required this.imageUrl,
    @required this.size,
    @required this.heroTag,
  }) : super(key: key);

  final String imageUrl;
  final Size size;
  final String heroTag;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(.85, -.6),
      child: Hero(
        tag: heroTag,
        child: CardImage(
          imageUrl: imageUrl,
          height: size.height * .25,
          width: size.width * .35,
          colorShadow: Color(0x40000000),
        ),
      ),
    );
  }
}

class _TitleMovie extends StatelessWidget {
  const _TitleMovie({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          SizedBox(width: 15.0),
          Flexible(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.surface,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

class _BackgroundPage extends StatelessWidget {
  const _BackgroundPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }
}

class _ShaderMaskCard extends StatelessWidget {
  const _ShaderMaskCard({
    Key key,
    @required this.heightCard,
  }) : super(key: key);

  final double heightCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightCard,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(
            color: Colors.purple,
            width: 1,
          )),
          gradient: LinearGradient(colors: [
        Colors.black26,
        Colors.transparent,
        Theme.of(context).primaryColor
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    );
  }
}
