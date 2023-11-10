import 'dart:ui';

import 'package:cis3334_unit10_gawboy/load_painting_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'painting_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'XKCD Comic List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// ==========================================================================
class _MyHomePageState extends State<MyHomePage> {

  int x = 0;
  List<PaintingInfo> gawboyPaintings = [];
  LoadPaintingInfo paintLoader = new LoadPaintingInfo();
  final PageController ctrl = PageController();

  @override
  void initState() {
    //gawboyPaintings =  paintLoader.getPaintingList();
    gawboyPaintings = paintLoader.InitInCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
            },
          ),
          child: PageView.builder(
              controller: ctrl,
              scrollDirection: Axis.vertical,
              itemCount: gawboyPaintings.length,
              itemBuilder: (BuildContext context, int position) {
                return Container(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/images/' +
                            gawboyPaintings[position].imageFile,
                            fit: BoxFit.cover),
                        Text(gawboyPaintings[position].name),
                        Text(gawboyPaintings[position].gawboyDescription),
                        //leading: Image(image: NetworkImage(xkcdComics[position].img)),
                      ],
                    )

                );
              }
          ),
        ),
      ),
    );
  }
}