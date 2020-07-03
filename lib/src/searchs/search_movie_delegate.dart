import 'package:filmaroo/src/models/movie.dart';
import 'package:filmaroo/src/pages/widgets/card_image.dart';
import 'package:filmaroo/src/pages/widgets/row_stars.dart';
import 'package:filmaroo/src/provider/movie_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () => query = '',
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _SearchResults(
      query: query,
      onTap: () => close(context, null),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _SearchResults(
      query: query,
      onTap: () => close(context, null),
    );
  }
}

class _SearchResults extends StatelessWidget {
  const _SearchResults({
    Key key,
    @required this.query,
    @required this.onTap,
  }) : super(key: key);

  final String query;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieProvider.searchMovie(query),
      builder: (context, AsyncSnapshot<List<Movie>> snapshot) {
        if (snapshot.hasData) {
          List<Movie> listMovie = snapshot.data;
          return ListView.builder(
            padding: const EdgeInsets.all(15.0),
            itemCount: listMovie.length,
            itemExtent: 150,
            itemBuilder: (context, index) {
              listMovie[index].uniqueId = "";
              return Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      onTap();
                      Navigator.pushNamed(
                        context,
                        'detail',
                        arguments: listMovie[index],
                      );
                    },
                    child: _SuggestMovie(
                      movie: listMovie[index],
                    ),
                  ),
                  Divider()
                ],
              );
            },
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}

class _SuggestMovie extends StatelessWidget {
  const _SuggestMovie({
    Key key,
    @required this.movie,
  }) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CardImage(
          imageUrl: movie.getPosterImagePath(),
          height: 120,
          width: 85,
        ),
        SizedBox(
          width: 10.0,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800]),
              ),
              Text(
                movie.originalTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, color: Colors.grey[600]),
              ),
              Text(
                movie.releaseDate.year.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).accentColor),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Votos ${movie.voteCount}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                      ),
                      RowStars(
                        color: Colors.orange,
                        stars: movie.voteAverage,
                        size: 12,
                      )
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  Text(
                    "${movie.voteAverage}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(Icons.star, color: Colors.amberAccent)
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
