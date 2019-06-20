import 'package:flutter/material.dart';
import 'package:flutterbeer/constants.dart';
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
  BeerTasting tasting;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.caption;
    return Padding(
      padding: standardPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Cover picture',
            style: textStyle,
          ),
          Expanded(
            flex: 10,
            child: Center(
              child: ImagePicking(
                image: tasting.image,
                onNewPhoto: (f) => tasting.image = f,
              ),
            ),
          ),
          Text(
            'Name of your beer tasting',
            style: textStyle,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) return 'Need to add a name';
              else tasting.title = value;
            },
          ),
        ],
      ),
    );
  }
}
