import 'package:filmaroo/src/pages/home.dart';
import 'package:filmaroo/src/pages/movie_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Filmaroo',
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage(),
        "detail": (BuildContext context) => MovieDetail()
      },
      theme: ThemeData(
        primaryColorBrightness: Brightness.dark,
        primaryColor: Colors.purple,
        primaryColorLight: Colors.purple[100],
        primaryColorDark: Colors.purple[800],
        accentColor: Colors.pink,
        indicatorColor: Colors.deepPurple,
        fontFamily: "Jost",
      ),
    );
  }
}
