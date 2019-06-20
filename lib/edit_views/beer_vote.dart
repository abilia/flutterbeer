import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:redux/redux.dart';

class BeerVote extends StatefulWidget {
    static const routeName = '/beervote';
    @override
    _BeerVoteState createState() => _BeerVoteState();
}

class _BeerVoteState extends State<BeerVote> {

  double _value = 0.0;
  void _setValue(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    Beer beer = ModalRoute.of(context).settings.arguments;

    return StoreConnector<AppState, Store<AppState>>( 
      converter: (Store<AppState> store) => store,
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(beer.name),
            actions: <Widget>[
              Builder(builder: (context) => IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  print('check pressed');
                  Navigator.pop(context);
                }
              )),
            ],
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                PreferredSize(
                  preferredSize: Size(120, 120),
                  child:
                    beer.image == null ? Image.asset('assets/img_beer_placeholder.png')
                      : Image.file(beer.image),
                ),
                Text('Points: $_value'),
                Slider(value: _value, onChanged: _setValue),
                Text('Den är alltså god'),
              ],
            ),
          ),
        );
      },
    );
  }
}