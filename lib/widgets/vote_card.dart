import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeer/edit_views/beer_vote.dart';
import 'package:flutterbeer/model/app_model.dart';

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
