import 'package:flutter/material.dart';

class BeerVote extends StatefulWidget {
    static const routeName = '/beervote';
    @override
    _BeerVoteState createState() => _BeerVoteState();
}

class _BeerVoteState extends State<BeerVote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VOTE')
      ),
      body: Text('YES'),
    );
  }
}