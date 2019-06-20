import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicking extends StatefulWidget {
  ImagePicking({this.image, this.onNewPhoto});
  final File image;
  final Function(File) onNewPhoto;
  @override
  _ImagePickingState createState() => _ImagePickingState(image, onNewPhoto);
}

class _ImagePickingState extends State<ImagePicking> {
  _ImagePickingState(this._image, this.onNewPhoto);
  File _image;
  Function(File) onNewPhoto;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = image;
      });
      onNewPhoto(image);
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = 60.0;
    return InkWell(
        onTap: getImage,
        child: AspectRatio(
          aspectRatio: 1,
          child: _image == null
              ? Container(
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.black26,
                    size: height,
                  ),
                  color: Colors.black12,
                )
              : Image.file(_image,),
        ));
  }
}
