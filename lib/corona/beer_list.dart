import 'package:flutter/material.dart';
import 'package:flutterbeer/corona/beer_card.dart';
import 'package:flutterbeer/corona/edit_beer.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/state/app_state.dart';

class CoronaBeerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (Store<AppState> store) => store.state,
      builder: (context, state) => ListView(
          children: state.coronabeers.map((beer) => CoronaBeerCard(
            beer: beer,
            onPressed: (beer) => Navigator.pushNamed(context, CoronaEditBeer.routeName, arguments: beer),
          )).toList()),
    );
  }
}
