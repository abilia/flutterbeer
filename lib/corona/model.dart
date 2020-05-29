import 'package:uuid/uuid.dart';

class CoronaBeer {
  String id;
  String name;
  String drinker;
  double points;
  CoronaBeer({this.name, this.drinker, this.points}) : id = Uuid().v4();

  factory CoronaBeer.fromJson(Map<String, dynamic> json)  {
    return CoronaBeer(
      name: json['name'],
      drinker: json['drinker'],
      points: json['points']
    );
  }
}