import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class BeerTasting {
  File image;
  String title;
  String id;
  List<Beer> beers = [];
  BeerTasting({ this.title, List<Beer> beers}) : 
  beers = beers == null ? [] : beers, 
  id = Uuid().v4();
}

class Beer {
  String id;
  String name;
  File image;
  Beer({this.name}) :
  id = Uuid().v4();
}

class BeerVote {
  String beerId;
  String beerMate;
  double points;
  BeerVote({@required this.beerId, @required this.points});
}