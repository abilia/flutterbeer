import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:image_picker/image_picker.dart';

class AddBeer extends StatefulWidget {
  final Beer beer;
  AddBeer({this.beer});
  @override
  _AddBeerState createState() => _AddBeerState(beer: beer);
}

class _AddBeerState extends State<AddBeer> {
  _AddBeerState({this.beer});
  final Beer beer;
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
          children: <Widget>[
            Text('Beer name'),
            TextFormField(
              controller: _controller,
              validator: (value) {
                if (value.isEmpty) return 'need to add a name';
              },
            ),
            RaisedButton(
              child: Text('Take a beerfy'),
              onPressed: getImage,
            ),
            Expanded(
              child: _image == null
                  ? Text('No image selected.')
                  : Image.file(_image),
            )
          ],
        ),
    );
  }
}
