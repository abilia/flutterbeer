import 'package:flutter/material.dart';

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
      child: Scaffold(
        appBar:  AppBar(
          title: Text("Create tasting"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: _controller,
              validator: (value) {
                if (value.isEmpty) return 'need to add a name';
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Submitting ')));
                  }
                },
                child: Text('Submit'),
              ),
            ),
            Expanded(
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20.0),
                crossAxisSpacing: 10.0,
                crossAxisCount: 2,
                children: beers.map((b) => Text(b)).toList(),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: Icon(Icons.add_box),
        ),
      ),
    );
  }
}
