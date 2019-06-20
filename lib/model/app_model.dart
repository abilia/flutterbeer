import 'dart:io';

class BeerTasting {
  File image;
  String title;
  String id;
  List<Beer> beers = [];
  BeerTasting({this.id, this.title, this.beers});
}

class Beer {
  String name;
  File image;
  Beer({this.name});
}
