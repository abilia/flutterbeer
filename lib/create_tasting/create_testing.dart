import 'package:flutter/material.dart';

import '../model/app_model.dart';
import 'add_beer_view.dart';
import 'tasting_info.dart';


class CreateTesting extends StatefulWidget {
  @override
  _CreateTestingState createState() => _CreateTestingState();
}

class _CreateTestingState extends State<CreateTesting> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController()..text = '';

  final List<String> beers = ['Lager', 'IPA', 'APA', 'NAIPA', 'Ale'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Create tasting"),
            actions: <Widget>[
              FlatButton(
                child: Icon(Icons.ac_unit),
                onPressed: (){},
                )
              ],
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              TastingInfo(
                  controller: _controller, formKey: _formKey, beers: beers),
                  AddBeer(beer: Beer()),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add');
            },
            child: Icon(Icons.add_box),
          ),
        ),
      ),
    );
  }
}

