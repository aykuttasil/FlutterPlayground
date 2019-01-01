import 'package:flutter/material.dart';
import 'package:flutterplayground/ui/widget/MyButton.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primaryColor: Colors.white,
        ),
        home: new MyHomePage(title: 'Flutter Demo Home Page'));
    //home: new EnglishWordsPage());
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getContent() async {
    /*var url = "http://example.com/whatsit/create";
    http.post(url, body: {"name": "doodle", "color": "blue"}).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });*/

    var cnt = await http.read("https://www.aykutasil.com");
    print(cnt);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[MyButton()],
            ),
            new Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: 300.0,
              height: 200.0,
              color: Colors.lightGreenAccent,
              child: Center(
                child: Text(
                  "Selam",
                  style: TextStyle(color: Colors.purple),
                ),
              ),
            ),
            new Text('You have pushed the button this many times:',
                style: new TextStyle(color: Colors.blue)),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: getContent,
        tooltip: 'Increment',
        child: new Icon(Icons.accessibility),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
