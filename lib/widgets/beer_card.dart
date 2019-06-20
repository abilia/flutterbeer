import 'package:flutter/material.dart';
import 'package:flutterbeer/model/app_model.dart';

class BeerCard extends StatelessWidget {
  const BeerCard(
      {Key key, @required this.beer, @required this.placement, this.onPressed})
      : super(key: key);

  final Function(Beer) onPressed;
  final Beer beer;
  final int placement;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.display1;
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () =>  {if (onPressed != null) onPressed(beer)},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(120),
                child: beer.image == null
                    ? Icon(Icons.gavel)
                    : Image.file(beer.image),
              ),
            ),
            Text(
              '#$placement - ${beer.name}',
              style: style,
            )
          ],
        ),
      ),
    );
  }
}
