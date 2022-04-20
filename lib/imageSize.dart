import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class ImageSize extends StatefulWidget {
  const ImageSize({Key? key}) : super(key: key);

  @override
  State<ImageSize> createState() => _ImageSizeState();
}

class _ImageSizeState extends State<ImageSize> {
  List<String> widgetList = [
    "cat1.jpeg",
    "cat2.jpeg",
    "cat5.jpg",
    "cat4.jpeg",
    "cat1.jpeg",
    "cat2.jpeg",
    "cat5.jpg",
    "cat4.jpeg"
  ];
  List<Map<String, dynamic>> sizesImage = [];

  ////////////////////////////

  assetimagesize(String imagecheck) async {
    final Image image = Image(image: AssetImage('asset/$imagecheck'));
    Completer<ui.Image> completer = new Completer<ui.Image>();
    image.image
        .resolve(new ImageConfiguration())
        .addListener(new ImageStreamListener((ImageInfo image, bool _) {
      completer.complete(image.image);
    }));
    ui.Image info = await completer.future;
    int width = info.width;
    int height = info.height;
    // print("$imagecheck  height:${height}");
    // print("$imagecheck width:${width}");
    sizesImage.add({
      "width": width,
      "height": height,
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widgetList.map((e) {
      assetimagesize(e);
      print("$e");
    }).toList();

    // assetimagesize(widgetList[0]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final double padding = 5;
    // final bottomPadd=MediaQuery.of(context).padding.bottom;
    // final topPadd=MediaQuery.of(context).padding.top;
    // print("padding----${topPadd} --${bottomPadd}");
    print("item height:${itemHeight}");
    print("item width:${itemWidth}");
    print("scree width:${size.width}");
    print("scree height:${size.height}");
    print("ratio  :${itemWidth / itemHeight}");

    return Scaffold(
      appBar: AppBar(
        title: Text("grid"),
      ),
      body: new Container(
        child: new GridView.count(
          // crossAxisSpacing: 1,
          crossAxisCount: 2,
          // mainAxisSpacing: 1,
          childAspectRatio: 1,
          controller: new ScrollController(keepScrollOffset: true),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: widgetList.map((String value) {
            return Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  Container(
                    color: Colors.blue,
                    child: Image(
                      image: AssetImage(
                        "asset/${value}",
                      ),
                      height: 400,
                      /////////////padding*2 = top + bottom padding//////40= sum of text container height(20 for each )x//////
                      // height: itemHeight - (padding*2 + 30),
                      // width: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.red,
                    // height: 20,
                    child: Text("helloo"),
                  ),
                  Container(
                    color: Colors.yellow,
                    width: double.infinity,

                    // height: 20,
                    child: Text("kjfhksdjfdgfdfggfdsfkjdjkdjf"),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
