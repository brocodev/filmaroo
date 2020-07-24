import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/models/movie_cast.dart';
import 'package:filmaroo/src/provider/movie_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MovieCastContainer extends StatelessWidget {
  const MovieCastContainer({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MovieProvider.getMovieCast(movie.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Cast> listCast = snapshot.data;
            return CastListView(listCast: listCast);
          } else {
            return Center(
              child: SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

class CastListView extends StatelessWidget {
  const CastListView({
    Key key,
    @required this.listCast,
  }) : super(key: key);

  final List<Cast> listCast;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: listCast.length,
      itemExtent: 160,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: <Widget>[
            ActorInfoCard(actor: listCast[index]),
          ],
        );
      },
    );
  }
}

class ActorInfoCard extends StatelessWidget {
  const ActorInfoCard({
    Key key,
    this.actor,
  }) : super(key: key);

  final Cast actor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 190,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black12,
                  offset: Offset(-3, 3),
                )
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
                imageUrl: actor.getProfileImagePath(), fit: BoxFit.cover),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    colors: [Colors.black38, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center)),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      actor.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      actor.character,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ])),
        ],
      ),
    );
  }
}
