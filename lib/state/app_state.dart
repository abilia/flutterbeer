import 'package:flutterbeer/model/app_model.dart';

class AppState {
  final List<BeerTasting> tastings;

  AppState(this.tastings);

  factory AppState.initial() => AppState(
      List.unmodifiable([BeerTasting(title: "Tasting1"), BeerTasting(title: "Tasting2")]));
}
