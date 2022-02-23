import 'package:explore/controllers/timeline.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ImageViewScreen extends StatefulWidget {
  var image_index;
  ImageViewScreen({this.image_index});

  @override
  _ImageViewScreenState createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image: AssetImage(TimeLine().imageList[widget.image_index].image))
    );
  }
}
