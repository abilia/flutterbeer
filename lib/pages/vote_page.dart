import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/widgets/vote_card.dart';

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
                      children: tasting.beers
                          .asMap()
                          .map((index, beer) {
                            return MapEntry(
                                index,
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 3, 5, 0),
                                  child: BeerVoteCard(
                                      beer: beer, position: index + 1),
                                ));
                          })
                          .values
                          .toList()),
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
