import 'package:flutter/material.dart';
import 'package:flutterbeer/model/app_model.dart';
import 'package:flutterbeer/widgets/image_picking.dart';

class TastingInfo extends StatefulWidget {
  TastingInfo(this.tasting);
  final BeerTasting tasting;
  @override
  _TastingInfoState createState() => _TastingInfoState(tasting);
}

class _TastingInfoState extends State<TastingInfo> {
  _TastingInfoState(this.tasting);
  TextEditingController _controller = TextEditingController();
  BeerTasting tasting;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _controller.text = tasting.title;
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.caption;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Cover picture',
            style: textStyle,
          ),
          ImagePicking(
            image: tasting.image,
            onNewPhoto: (f) => tasting.image = f,
          ),
          Spacer(),
          Text(
            'Name of your beer tasting',
            style: textStyle,
          ),
          TextFormField(
            key: _formKey,
            controller: _controller,
            validator: (value) {
              if (value.isEmpty) return 'Need to add a name';
            },
          ),
          Spacer(
            flex: 20,
          ),
        ],
      ),
    );
  }
}
