import 'dart:io';

class BeerTasting {
  File image;
  String title;
  List<Beer> beers = [];
  BeerTasting({this.title});
}

class Beer {
  String name;
  File image;
}
