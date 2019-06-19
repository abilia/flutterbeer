import 'package:flutter/material.dart';

class Vote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Title"),
            ],
          ),
          Row(
            children: <Widget>[
              RaisedButton(
                child: Text('Back'),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
