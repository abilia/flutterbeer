import 'package:flutter/material.dart';
import 'package:flutterbeer/model/app_model.dart';

class BeerList extends StatelessWidget {
  BeerList(this.beers);
  final List<Beer> beers;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: beers.map((beer) => BeerCard(beer: beer,)).toList()
    );
  }
}

class BeerCard extends StatelessWidget {
  const BeerCard({
    Key key,
    @required this.beer,
  }) : super(key: key);

  final Beer beer;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.body1;
    return Card(
      child: InkWell(
        child: Row(
          children: <Widget>[
            ClipRect(child: 
            beer.image == null ?
              Icon(Icons.gavel) :
              Image.file(beer.image),
            ),
            Text(beer.name, style: style,)
          ],
        ),
      ),
    );
  }
}


