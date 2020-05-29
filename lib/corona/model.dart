import 'package:uuid/uuid.dart';

class CoronaBeer {
  String id;
  int beerId;
  String name;
  String drinker;
  int points;
  CoronaBeer({this.beerId, this.name, this.drinker, this.points}) : id = Uuid().v4();

  factory CoronaBeer.fromJson(Map<String, dynamic> json)  {
    return CoronaBeer(
      beerId: json['id'],
      name: json['name'],
      drinker: json['drinker'],
      points: json['points']
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'drinker': drinker,
      'points':  points,
    };
  }
}