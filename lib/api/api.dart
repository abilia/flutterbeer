import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutterbeer/model/app_model.dart';

const BASE_URL = "https://beer.abilia-gbg.se";

Future<List<dynamic>> getBeerTastings() async {
  var client = http.Client();

  final response = await client.get("$BASE_URL/api/v1/tastings")
                        .whenComplete(client.close);

  return (json.decode(response.body) as List)
          .map((e) => new BeerTasting.fromJson(e))
          .toList();
}

Future<List<dynamic>> getBeers(tastingId) async {
  var client = http.Client();

  final response = await client.get("$BASE_URL/api/v1/tastings/$tastingId/beers")
                          .whenComplete(client.close);

  return (json.decode(response.body) as List)
          .map((e) => new Beer.fromJson(e))
          .toList();
}

Future<BeerTasting> addBeerTasting(BeerTasting beerTasting) async {
  var client = http.Client();

  final response = await client.post("$BASE_URL/api/v1/tastings",
                                    headers: {"Content-Type": "application/json"},
                                    body: json.encode(beerTasting.toJson()))
                          .whenComplete(client.close);
  
  switch (response.statusCode) {
    case 200: return new BeerTasting.fromJson(json.decode(response.body));
    default: return null;
  }

}