import 'package:flutter/material.dart';


class TitleHeaderMovie extends StatelessWidget {
  const TitleHeaderMovie({
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
