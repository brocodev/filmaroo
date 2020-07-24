import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    Key key,
    this.colors,
    this.end = Alignment.topCenter,
    this.begin = Alignment.bottomCenter,
  }) : super(key: key);

  final List<Color> colors;
  final AlignmentGeometry end;
  final AlignmentGeometry begin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors ??
              [
                Theme.of(context).primaryColor,
                Theme.of(context).accentColor,
              ],
          end: end,
          begin: begin,
        ),
      ),
    );
  }
}
