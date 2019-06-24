import 'package:flutter/material.dart';
import 'package:flutterbeer/model/app_model.dart';

class BeerInfo extends StatelessWidget {
  final Beer beer;
  final int position;

  BeerInfo({this.beer, this.position});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            backgroundImage: beer.image == null
                    ? AssetImage('assets/img_beer_thumbnail_placeholder.png')
                    : FileImage(beer.image),
            backgroundColor: Colors.grey[300]),
        ),
        Text("#$position - ${beer.name}")
      ],
    );
  }
}
