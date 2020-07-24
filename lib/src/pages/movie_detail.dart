import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/pages/widgets/card_image.dart';
import 'package:filmaroo/src/pages/widgets/gradient_background.dart';
import 'package:filmaroo/src/pages/widgets/movie_detail/details_movie.dart';
import 'package:filmaroo/src/pages/widgets/movie_detail/image_header.dart';
import 'package:filmaroo/src/pages/widgets/movie_detail/title_detail_movie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/movie_detail/shader_mask_header.dart';

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
          GradientBackground(
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).primaryColor,
            ],
            end: Alignment.center,
          ),
          DetailsMovie(movie: movie, topPadding: heightCard),
          ImageHeader(
              imageUrl: movie.getBackdropImagePath(), heightCard: heightCard),
          ShaderMaskHeader(heightCard: heightCard),
          Align(
            alignment: Alignment(.85, -.6),
            child: Hero(
              tag: movie.uniqueId,
              child: CardImage(
                imageUrl: movie.getPosterImagePath(),
                height: size.height * .25,
                width: size.width * .35,
                colorShadow: Color(0x40000000),
              ),
            ),
          ),
          TitleHeaderMovie(title: movie.title),
        ],
      ),
    );
  }
}
