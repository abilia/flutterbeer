import 'package:flutter/material.dart';
import 'package:flutterbeer/add_beer_view.dart';
import 'package:flutterbeer/create_testing.dart';
import 'package:flutterbeer/join_testing.dart';
import 'package:flutterbeer/vote.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MainScreen(),
        '/create': (context) => CreateTesting(),
        '/create/add': (context) => AddBeer(),
        '/join': (context) => JoinTesting(),
        '/vote': (context) => Vote()
      },
      title: 'Flutter beer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.local_bar),
        title: Text('flutter bear'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RaisedButton(
                child: Text('Create'),
                onPressed: () {
                  Navigator.pushNamed(context, '/create');
                }),
            RaisedButton(
              child: Text('Vote'),
              onPressed: () {
                Navigator.pushNamed(context, '/vote');
              },
            )
          ],
        ),
      ),
    );
  }
}
