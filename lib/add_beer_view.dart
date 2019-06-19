import 'package:flutter/material.dart';

class AddBeer extends StatefulWidget {
  @override
  _AddBeerState createState() => _AddBeerState();
}

class _AddBeerState extends State<AddBeer> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController()..text = 'beer theme';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Scaffold(

        body: Text('add beer'),
        floatingActionButton: FloatingActionButton(onPressed: (){},),
      ),
    );
  }
}
