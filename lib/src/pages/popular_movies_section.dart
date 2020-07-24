import 'package:filmaroo/src/provider/movie_provider.dart';
import 'package:flutter/material.dart';

import 'widgets/home/horizontal_movie_list.dart';

class PopularMoviesSection extends StatelessWidget {
  const PopularMoviesSection({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 20.0),
            child: Text("Mas populares",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                  color: Theme.of(context).primaryColorDark,
                )),
          ),
          SizedBox(height: 10.0),
          FutureBuilder(
            future: MovieProvider.getPopular(),
            builder: (context, snapshot) {
              return (snapshot.connectionState == ConnectionState.done)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: HorizontalMovieList(
                        itemList: snapshot.data,
                        itemHeight: size.height * .38,
                        itemWith: size.width * .42,
                      ),
                    )
                  : SizedBox(height: size.height * .38);
            },
          )
        ],
      ),
    );
  }
}
