class BeerTasting {
  String id;
  String title;
  List<Beer> beers;
  BeerTasting(String id, String title, List<Beer> beers) {
    this.id = id;
    this.title = title;
    this.beers = beers;
  }
}

class Beer {
  String name;
  Beer(String name) {
    this.name = name;
  }
}

