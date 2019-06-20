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
  CreateTasting(this.tasting);
  final BeerTasting tasting;
  @override
  _CreateTastingState createState() => _CreateTastingState(tasting);
}

class _CreateTastingState extends State<CreateTasting>
    with SingleTickerProviderStateMixin {
  _CreateTastingState(this.tasting);

  final BeerTasting tasting;
  TabController _tabController;

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
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text("New beer tasting"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    tasting.title = "fafafdafa";
                    store.dispatch(ActionPayload(Actions.AddTasting, data: tasting));
                    Navigator.pop(context);
                  } 
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
