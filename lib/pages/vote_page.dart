import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/edit_views/beer_vote.dart';
import 'package:redux/redux.dart';

class VotePage extends StatelessWidget {
  static const routeName = '/vote';
  @override
  Widget build(BuildContext context) {
    final String tastingId = ModalRoute.of(context).settings.arguments;

    return StoreConnector<AppState, BeerTasting>(
        converter: (Store<AppState> store) => store.state.tastings
            .singleWhere((tasting) => tasting.id == tastingId),
        builder: (context, tasting) {
          return DefaultTabController(
            child: Scaffold(
              appBar: AppBar(
                title: Text(tasting.title),
                bottom: TabBar(
                  tabs: <Widget>[
                    Tab(text: "Beers"),
                    Tab(text: "Photos"),
                    Tab(text: "Beermates")
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Column(
                      children:
                          tasting.beers.map((t) => Text(t.name)).toList()),
                  Text("Photos of beers"),
                  Text("The beermates"),
                ],
              ),
            ),
            length: 3,
          );
        });
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
