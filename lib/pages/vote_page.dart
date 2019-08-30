import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/view_model/view_model.dart';
import 'package:redux/redux.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/widgets/vote_card.dart';

class VotePage extends StatelessWidget {
  static const routeName = '/vote';
  @override
  Widget build(BuildContext context) {
    final String tastingId = ModalRoute.of(context).settings.arguments;

    return StoreConnector<AppState, _ViewModel>(
        converter: (Store<AppState> store) =>
            _ViewModel.create(store, tastingId),
        builder: (context, model) {
          return DefaultTabController(
            child: Scaffold(
              appBar: AppBar(
                title: Text(model.title),
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
                      children: model.beerInfo.map((beerInfo) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(5, 3, 5, 0),
                      child: BeerVoteCard(beerInfo: beerInfo),
                    );
                  }).toList()),
                  ListView(
                      children: model.beerInfo.map((beerInfo) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: beerInfo.beer.image == null
                            ? Image.asset('assets/img_beer_placeholder.png')
                            : Image.file(beerInfo.beer.image),
                      ),
                    );
                  }).toList()),
                  Text("The beermates"),
                ],
              ),
            ),
            length: 3,
          );
        });
  }
}

class _ViewModel {
  final List<BeerInfo> beerInfo;
  final String title;

  _ViewModel({@required this.beerInfo, @required this.title});

  factory _ViewModel.create(Store<AppState> store, String tastingId) {
    final BeerTasting tasting =
        store.state.tastings.singleWhere((tasting) => tasting.id == tastingId);
    final List<BeerInfo> bwv = tasting.beers
        .asMap()
        .map((index, beer) {
          final vote = store.state.votes
              .firstWhere((vote) => vote.beerId == beer.id, orElse: () => null);
          final votePoints = vote == null ? null : vote.points;
          return MapEntry(index,
              BeerInfo(beer: beer, beerVote: votePoints, position: index + 1));
        })
        .values
        .toList();
    return _ViewModel(beerInfo: bwv, title: tasting.title);
  }
}
