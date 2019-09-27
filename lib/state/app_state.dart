import 'package:flutter/widgets.dart';
import 'package:flutterbeer/model/app_model.dart';

@immutable
class AppState {
  final List<BeerTasting> tastings;
  final List<BeerVote> votes;

  AppState({@required this.tastings, @required this.votes});

  factory AppState.initial() => AppState(
      tastings: List.unmodifiable([]),
      votes: List.unmodifiable([]));
}
