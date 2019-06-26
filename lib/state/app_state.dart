import 'package:flutter/widgets.dart';
import 'package:flutterbeer/model/app_model.dart';

@immutable
class AppState {
  final List<BeerTasting> tastings;
  final List<BeerVote> votes;

  AppState({@required this.tastings, @required this.votes});

  factory AppState.initial() => AppState(
      tastings: List.unmodifiable([
        BeerTasting(
            title: "IPA", beers: [Beer(name: "IPA 1"), Beer(name: "IPA 2")]),
        BeerTasting(
            title: "Lagers!",
            beers: [Beer(name: "LAger 1"), Beer(name: "Lager 2")])
      ]),
      votes: List.unmodifiable([]));
}
