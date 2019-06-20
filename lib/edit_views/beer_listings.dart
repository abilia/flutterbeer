import 'package:flutter/material.dart';
import 'package:flutterbeer/constants.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/widgets/beer_card.dart';

import 'edit_beer.dart';

class BeerList extends StatelessWidget {
  BeerList(this.beers);
  final List<Beer> beers;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: standardPadding,
      child: beers.isEmpty ? Column(children: <Widget>[
        Image.asset('assets/img_beer_placeholder.png'),
        Text('no 🍺 yet :(', style: Theme.of(context).textTheme.display3,)
      ],) :
      ListView(
          children: beers
              .map((beer) => BeerCard(
                    beer: beer,
                    placement: beers.indexOf(beer) + 1,
                    onPressed: (beer) => Navigator.pushNamed(context, EditBeer.routeName, arguments: beer),
                  ))
              .toList()),
    );
  }
}
