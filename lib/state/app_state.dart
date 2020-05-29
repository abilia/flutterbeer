import 'package:flutter/widgets.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/corona/model.dart';

@immutable
class AppState {
  final List<BeerTasting> tastings;
  final List<BeerVote> votes;
  final List<CoronaBeer> coronabeers;

  AppState({@required this.tastings, @required this.votes, @required this.coronabeers});

  factory AppState.initial() => AppState(
      tastings: List.unmodifiable([]),
      votes: List.unmodifiable([]),
      coronabeers: List.unmodifiable([CoronaBeer(name: 'Beer1', drinker: 'Jojo2', points: 3.0)])
  );
}
