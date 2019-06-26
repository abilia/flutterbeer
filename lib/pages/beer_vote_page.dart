import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/state/reducer.dart';
import 'package:flutterbeer/view_model/view_model.dart';
import 'package:redux/redux.dart';

class BeerVotePage extends StatefulWidget {
  static const routeName = '/beervote';
  @override
  _BeerVotePageState createState() => _BeerVotePageState();
}

class _BeerVotePageState extends State<BeerVotePage> {
  double _value;
  void _setValue(double value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    BeerInfo beerInfo = ModalRoute.of(context).settings.arguments;
    if (_value == null) {
      _value = beerInfo.beerVote == null ? 0.0 : beerInfo.beerVote;
    }

    return StoreConnector<AppState, Store<AppState>>(
      converter: (Store<AppState> store) => store,
      builder: (context, store) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(beerInfo.beer.name),
            actions: <Widget>[
              Builder(
                  builder: (context) => IconButton(
                      icon: Icon(Icons.check),
                      onPressed: () {
                        store.dispatch(ActionPayload(
                            action: Actions.VotePlaced,
                            data: BeerVote(
                                beerId: beerInfo.beer.id, points: _value)));
                        Navigator.pop(context);
                      })),
            ],
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: PreferredSize(
                    preferredSize: Size(120, 120),
                    child: beerInfo.beer.image == null
                        ? Image.asset('assets/img_beer_placeholder.png')
                        : Image.file(beerInfo.beer.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text('${_value.toStringAsFixed(1)}p',
                      style:
                          TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Slider(
                    value: _value,
                    onChanged: _setValue,
                    max: 5.0,
                    min: 0.0,
                    divisions: 50,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
