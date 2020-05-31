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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${beer.name}", style: Theme.of(context).textTheme.headline4),
                  Text("${beer.drinker}", style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text("${(beer.points / 10).toStringAsFixed(1)}p",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
            ),
          ],
        ),
      ),
    );
  }
}
