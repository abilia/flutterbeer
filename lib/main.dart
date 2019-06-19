import 'package:flutter/material.dart';
import 'package:flutterbeer/create_testing.dart';
import 'package:flutterbeer/join_testing.dart';

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
        '/join': (context) => JoinTesting(),
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
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text("Create"),
          onPressed: () {
            Navigator.pushNamed(context, '/create');
          }),
        RaisedButton(
          child: Text("Join"),
          onPressed: (){
            Navigator.pushNamed(context, '/join');
          },)
      ],),
    );
  }
}
