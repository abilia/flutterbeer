import 'package:flutter/material.dart';
import 'package:flutterbeer/corona/model.dart';

class CoronaBeerCard extends StatelessWidget {
  const CoronaBeerCard(
      {Key key, @required this.beer, this.onPressed})
      : super(key: key);

  final Function(CoronaBeer) onPressed;
  final CoronaBeer beer;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () => {if (onPressed != null) onPressed(beer)},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  Text("${beer.name}")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
