import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/state/actions.dart';

import 'package:flutterbeer/constants.dart';
import 'package:flutterbeer/corona/model.dart';

class CoronaEditBeer extends StatefulWidget {
  static const routeName = '/coronaeditbeer';
  
  @override
  _CoronaEditBeerState createState() => _CoronaEditBeerState();
}

class _CoronaEditBeerState extends State<CoronaEditBeer> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _drinkerController = TextEditingController();

  double _points;
  void _setPoints(double points) => setState(() => _points = points);

  @override
  Widget build(BuildContext context) {
    CoronaBeer beer = ModalRoute.of(context).settings.arguments;
    bool update = beer.beerId != null;

    _nameController.text = beer.name;
    _drinkerController.text = beer.drinker;

    if (_points == null) {
      _points = beer.points == null ? 0.0 : beer.points / 10;
    }

    return StoreConnector<AppState, Store<AppState>>(
        converter: (Store<AppState> store) => store,
        builder: (context, store) {
          return Scaffold(
            appBar: AppBar(
            title: Text('${update ? 'Edit' : 'New'} beer'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    beer.name = _nameController.text;
                    beer.drinker = _drinkerController.text;
                    beer.points = (_points * 10).round();
                    store.dispatch(upsertCoronaBeerThunk(update, beer));
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
                    controller: _nameController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'The beer needs a name!';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  Text('Your name'),
                  TextFormField(
                    controller: _drinkerController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Someone has to drink the beer!';
                      }
                      return null;
                    }
                  ),
                  SizedBox(height: 30,),
                  Text('Points'),
                  Text('${_points.toStringAsFixed(1)}p', style: TextStyle(fontWeight: FontWeight.bold)),
                  Slider(
                    value: _points,
                    onChanged: _setPoints,
                    max: 5.0,
                    min: 0.0,
                    divisions: 50,
                  ),
                ],
              ),
            ),
          ),
        );
    });
  }
}
