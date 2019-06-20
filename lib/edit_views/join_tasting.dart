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
    final height = 60.0;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          InkWell(
              child: AspectRatio(
            aspectRatio: 2,
            child: beerTasting.image == null
                ? Container(
                    child: Icon(
                      Icons.image,
                      color: Colors.black26,
                      size: height,
                    ),
                    color: Colors.black12,
                  )
                : Image.file(beerTasting.image),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              RaisedButton(
                  child: Text("JOIN TASTING"),
                  onPressed: () {
                    Navigator.pushNamed(context, Vote.routeName,
                        arguments: beerTasting.id);
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
