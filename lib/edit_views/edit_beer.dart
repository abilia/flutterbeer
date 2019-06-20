import 'package:flutter/material.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/widgets/image_picking.dart';

class EditBeer extends StatefulWidget {
  static const routeName = '/editbeer';
  @override
  _EditBeerState createState() => _EditBeerState();
}

class _EditBeerState extends State<EditBeer> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Beer beer = ModalRoute.of(context).settings.arguments;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Beer photo'),
            ImagePicking(
              image: beer.image,
              onNewPhoto: (f) => beer.image = f,
            ),
            Text('Name of your beer'),
            TextFormField(
              controller: _controller,
              validator: (value) {
                if (value.isEmpty) return 'The beer needs a name!';
              },
            ),
          ],
        ),
      ),
    );
  }
}
