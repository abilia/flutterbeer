import 'package:flutterbeer/model/app_model.dart';

class AppState {
  final List<BeerTasting> tastings;

  AppState(this.tastings);

  factory AppState.initial() => AppState(List.unmodifiable([
        BeerTasting("1", "My favorite IPAS", [Beer("GO IPA"), Beer("Ipa 2")]),
        BeerTasting("2", "Lager wihooo!", [Beer("Lager 1"), Beer("Lager 2")])
      ]));
}
