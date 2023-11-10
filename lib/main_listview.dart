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

  void displayPainting(int position) {
    showDialog<String>(
        context: context,
        builder: (BuildContext context) =>
            SimpleDialog(
              backgroundColor: Colors.blue[100],
              title: Text(gawboyPaintings[position].name),
              children: [
                Image.asset('assets/images/'+gawboyPaintings[position].imageFile,fit: BoxFit.cover),
                ElevatedButton(
                  child: Text("Close"),
                  onPressed: () { Navigator.pop(context);},
                ),
              ],
            )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: gawboyPaintings.length,
          itemBuilder: (BuildContext context, int position){
            return ListTile(
                title: Text(gawboyPaintings[position].name),
                subtitle: Text(gawboyPaintings[position].gawboyDescription),
                leading: Image.asset('assets/images/'+gawboyPaintings[position].imageFile),
                //leading: Image(image: NetworkImage(xkcdComics[position].img)),
                onTap: () {
                  displayPainting(position);
                }
            );
          }
      ),
    );
  }
}