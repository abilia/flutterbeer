import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeer/edit_views/beer_vote.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/widgets/beer_info.dart';

class BeerVoteCard extends StatelessWidget {
  final Beer beer;
  final int position;

  BeerVoteCard({this.beer, this.position});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, BeerVote.routeName, arguments: beer),
      child: SizedBox(
        height: 60,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: BeerInfo(beer: beer, position: position),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text("5p",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              )
            ])),
      ),
    );
  }
}
