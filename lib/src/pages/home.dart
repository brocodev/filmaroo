import 'package:filmaroo/src/pages/widgets/card_swiper.dart';
import 'package:filmaroo/src/pages/widgets/horizontal_movie_list.dart';
import 'package:filmaroo/src/provider/movie_provider.dart';
import 'package:filmaroo/src/searchs/search_movie_delegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
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
            onPressed: (){
              showSearch(context: context, delegate: SearchMovieDelegate());
            },
//            splashColor: Colors.transparent,
//            highlightColor: Colors.transparent,
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).accentColor,
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    width: double.infinity,
                    height: size.height * .45,
                    child: FutureBuilder(
                        future: MovieProvider.getNowPlaying(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return CardSwiper(itemList: snapshot.data);
                          } else {
                            return Center(
                                child: SizedBox(
                                    height: 70,
                                    width: 70,
                                    child: CircularProgressIndicator(
                                      backgroundColor:
                                          Theme.of(context).primaryColorLight,
                                      strokeWidth: 6.0,
                                    )));
                          }
                        }),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
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
                          return (snapshot.connectionState ==
                                  ConnectionState.done)
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
