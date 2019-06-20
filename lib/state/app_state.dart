import 'package:flutterbeer/model/app_model.dart';

class AppState {
  final List<BeerTasting> tastings;

  AppState(this.tastings);

  factory AppState.initial() => AppState(List.unmodifiable([
        BeerTasting(
            id: "1",
            title: "IPA",
            beers: [Beer(name: "IPA 1"), Beer(name: "IPA 2")]),
        BeerTasting(
            id: "2",
            title: "Lagers!",
            beers: [Beer(name: "LAger 1"), Beer(name: "Lager 2")])
      ]));
}
