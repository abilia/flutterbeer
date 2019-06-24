import 'package:flutter/material.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/widgets/beer_info.dart';

class BeerCard extends StatelessWidget {
  const BeerCard(
      {Key key, @required this.beer, @required this.placement, this.onPressed})
      : super(key: key);

  final Function(Beer) onPressed;
  final Beer beer;
  final int placement;

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
              child: BeerInfo(beer: beer, position: placement),
            )
          ],
        ),
      ),
    );
  }
}
