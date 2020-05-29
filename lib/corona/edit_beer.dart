import 'package:flutter/material.dart';
import 'package:flutterbeer/constants.dart';
import 'package:flutterbeer/corona/model.dart';

class CoronaEditBeer extends StatefulWidget {
  static const routeName = '/coronaeditbeer';
  @override
  _CoronaEditBeerState createState() => _CoronaEditBeerState();
}

class _CoronaEditBeerState extends State<CoronaEditBeer> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CoronaBeer beer = ModalRoute.of(context).settings.arguments;
    _controller.text = beer.name;

    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit a beer'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                beer.name = _controller.text;
                Navigator.pop(context, beer);
              }
            },
          )
        ],
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: standardPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name of your beer'),
              TextFormField(
                controller: _controller,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'The beer needs a name!';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
