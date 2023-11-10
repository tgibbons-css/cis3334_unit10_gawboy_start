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

  @override
  void initState() {
    //gawboyPaintings =  paintLoader.getPaintingList();
    gawboyPaintings =  paintLoader.InitInCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
          itemCount: gawboyPaintings.length,
          itemBuilder: (BuildContext context, int position){
            return Container(
                child: Stack(
                  children: <Widget>[
                    Text(gawboyPaintings[position].name),
                    Text(gawboyPaintings[position].gawboyDescription),
                    Image.asset('assets/images/'+gawboyPaintings[position].imageFile),
                    //leading: Image(image: NetworkImage(xkcdComics[position].img)),
                  ],
                )

            );
          }
      ),
    );
  }
}