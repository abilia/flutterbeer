import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/edit_views/beer_vote.dart';
import 'package:redux/redux.dart';

class Vote extends StatelessWidget {
  static const routeName = '/vote';
  @override
  Widget build(BuildContext context) {
    final String tastingId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Make your votes"),
      ),
      body: Column(
        children: <Widget>[
          StoreConnector<AppState, BeerTasting>(
              converter: (Store<AppState> store) => store.state.tastings
                  .singleWhere((tasting) => tasting.id == tastingId),
              builder: (context, tasting) {
                final c = List<Widget>.of([Text(tasting.title)]);
                c.addAll((tasting.beers.map((b) => BeerVoteCard(beer: b)).toList()));
                return Column(children: c);
              }),
        ],
      ),
    );
  }
}

class BeerVoteCard extends StatelessWidget {
  final Beer beer;

  BeerVoteCard({this.beer});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RaisedButton(
        child: Text(beer.name),
        onPressed: () {
          Navigator.pushNamed(context, BeerVote.routeName, arguments: beer);
        }),
    );
  }
}