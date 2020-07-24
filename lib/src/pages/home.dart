import 'package:filmaroo/src/pages/popular_movies_section.dart';
import 'package:filmaroo/src/searchs/search_movie_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/gradient_background.dart';
import 'widgets/home/movies_swiper_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: buildAppBar(context),
      body: Stack(
        children: <Widget>[
          GradientBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: size.height * .45,
                    child: MoviesSwiperBuilder(),
                  ),
                ),
                SizedBox(height: 20.0),
                PopularMoviesSection(size: size)
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).accentColor,
      elevation: 0,
      title: Text(
        "FILMAROO",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          letterSpacing: 2.5,
        ),
      ),
      centerTitle: true,
      leading: Icon(CupertinoIcons.video_camera_solid),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            showSearch(context: context, delegate: SearchMovieDelegate());
          },
//            splashColor: Colors.transparent,
//            highlightColor: Colors.transparent,
        )
      ],
    );
  }
}
