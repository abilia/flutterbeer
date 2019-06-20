import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/edit_views/create_tasting.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/vote.dart';
import 'package:redux/redux.dart';

class JoinTasting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (Store<AppState> store) => store.state,
      builder: (context, state) => ListView(
              children: state.tastings.map((t) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: JoinCard(beerTasting: t),
            );
          }).toList()),
    );
  }
}

class JoinCard extends StatelessWidget {
  final BeerTasting beerTasting;

  JoinCard({this.beerTasting});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: <Widget>[
          InkWell(
              onTap: () => Navigator.pushNamed(context, CreateTasting.routeName,
                  arguments: beerTasting),
              child: AspectRatio(
                aspectRatio: 16.0 / 9.0,
                child: beerTasting.image == null
                    ? Image.asset('assets/img_beer_tasting_placeholder.png')
                    : Image.file(beerTasting.image),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                  Text(beerTasting.title, style: Theme.of(context).textTheme.headline,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: RaisedButton(
                        child: Text("JOIN TASTING"),
                        onPressed: () {
                          Navigator.pushNamed(context, Vote.routeName,
                              arguments: beerTasting.id);
                        }),
                  ),
                ],),
              )
        ],
      ),
    );
  }
}
