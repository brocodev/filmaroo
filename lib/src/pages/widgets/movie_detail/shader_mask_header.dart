import 'package:flutter/material.dart';


class ShaderMaskHeader extends StatelessWidget {
  const ShaderMaskHeader({
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
          border: Border(
              bottom: BorderSide(
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
