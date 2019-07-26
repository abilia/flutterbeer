import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterbeer/edit_views/beer_listings.dart';
import 'package:flutterbeer/edit_views/edit_beer.dart';
import 'package:flutterbeer/edit_views/edit_tasting.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/state/app_state.dart';
import 'package:flutterbeer/state/reducer.dart';
import 'package:redux/redux.dart';

class CreateTasting extends StatefulWidget {
  static const routeName = '/editTasting';
  CreateTasting({BeerTasting tasting})
      : update = tasting != null,
        tasting = tasting != null ? tasting : BeerTasting();
  final BeerTasting tasting;
  final bool update;
  @override
  _CreateTastingState createState() => _CreateTastingState(tasting, update);
}

class _CreateTastingState extends State<CreateTasting>
    with SingleTickerProviderStateMixin {
  _CreateTastingState(this.tasting, this.update);

  final BeerTasting tasting;
  final bool update;
  TabController _tabController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabIndex);
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabIndex() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Store<AppState>>(
        converter: (Store<AppState> store) => store,
        builder: (context, store) {
          return Form(
            key: _formKey,
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
                title: Text('${update ? 'Edit' : 'New'} beer tasting'),
                actions: <Widget>[
                  Builder(
                    builder: (context) => IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (tasting.title == null) {
                              Scaffold.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(SnackBar(
                                  content: Text('Must give tasting a name!'),
                                  duration: Duration(seconds: 3),
                                ));
                              return;
                            }
                            store.dispatch(ActionPayload(
                                action: update
                                    ? BeerActions.EditTasting
                                    : BeerActions.AddTasting,
                                data: tasting));
                            Navigator.pop(context);
                          }
                        }),
                  )
                ],
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(
                      text: 'Name',
                    ),
                    Tab(
                      text: 'Beers',
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                controller: _tabController,
                children: [
                  TastingInfo(tasting),
                  BeerList(tasting.beers),
                ],
              ),
              floatingActionButton: _bottomButtons(),
            ),
          );
        });
  }

  Widget _bottomButtons() => _tabController.index == 1
      ? FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: () => _navigateToAddNewBeer(context),
          child: Icon(
            Icons.add,
          ),
        )
      : null;

  _navigateToAddNewBeer(BuildContext context) async {
    final beer = await Navigator.pushNamed(context, EditBeer.routeName,
        arguments: Beer());
    if (beer != null) {
      setState(() {
        tasting.beers.add(beer);
      });
    }
  }
}
