import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:redux/redux.dart';

import '../vote.dart';

class JoinTasting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StoreConnector<AppState, AppState>(
        converter: (Store<AppState> store) => store.state,
        builder: (context, state) => Column(
                children: state.tastings.map((t) {
              return JoinCard(beerTasting: t);
            }).toList()),
      ),
    );
  }
}

class JoinCard extends StatelessWidget {
  final BeerTasting beerTasting;

  JoinCard({this.beerTasting});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(beerTasting.title),
        onPressed: () {
          Navigator.pushNamed(context, Vote.routeName,
              arguments: beerTasting.id);
        });
  }
}
