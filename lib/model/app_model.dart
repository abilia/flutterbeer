import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class BeerTasting {
  File image;
  String title;
  String id;
  int tastingId;
  List<Beer> beers = [];
  BeerTasting({ this.title, this.tastingId, List<Beer> beers}) : 
  beers = beers == null ? [] : beers, 
  id = Uuid().v4();

  factory BeerTasting.fromJson(Map<String, dynamic> json) {
    return BeerTasting(
      title: json['name'],
      tastingId: json['id'],
      beers: []);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': title
    };
  }
}

class Beer {
  String id;
  String name;
  File image;
  Beer({this.name}) :
  id = Uuid().v4();

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      name: json['name']
    );
  }
}

class BeerVote {
  String beerId;
  String beerMate;
  double points;
  BeerVote({@required this.beerId, @required this.points});
}