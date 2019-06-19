import 'package:flutter/material.dart';

class TastingInfo extends StatelessWidget {
  const TastingInfo({
    Key key,
    @required TextEditingController controller,
    @required GlobalKey<FormState> formKey,
    @required this.beers,
  })  : _controller = controller,
        _formKey = formKey,
        super(key: key);

  final TextEditingController _controller;
  final GlobalKey<FormState> _formKey;
  final List<String> beers;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                Navigator.pop(context);
              }
            },
            child: Text('Submit'),
          ),
        ),
      ],
    );
  }
}
