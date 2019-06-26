import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbeer/pages/beer_vote_page.dart';
import 'package:flutterbeer/view_model/view_model.dart';
import 'package:flutterbeer/widgets/beer_info.dart';

class BeerVoteCard extends StatelessWidget {
  final BeerInfo beerInfo;

  BeerVoteCard({@required this.beerInfo});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, BeerVotePage.routeName, arguments: beerInfo),
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
                    child: BeerInfoWidget(beer: beerInfo.beer, position: beerInfo.position),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: this.beerInfo.beerVote == null
                        ? Text("")
                        : Text("${this.beerInfo.beerVote.toStringAsFixed(1)}p",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                  )
                ])),
      ),
    );
  }
}
