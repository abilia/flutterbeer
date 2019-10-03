import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutterbeer/model/app_model.dart';

const BASE_URL = "https://beer.abilia-gbg.se";
// const BASE_URL = "http://192.168.13.235:8000";

Future<List<dynamic>> getBeerTastings() async {
  var client = http.Client();

  final response = await client.get("$BASE_URL/api/v1/tastings")
                        .whenComplete(client.close);

  return (json.decode(response.body) as List)
          .map((e) => new BeerTasting.fromJson(e))
          .toList();
}