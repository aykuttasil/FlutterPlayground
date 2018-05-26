import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "About Page",
      home: AboutPage(),
    );
  }
}

class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.title}) : super(key: key);

  var title;

  @override
  _AboutPageState createState() => new _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
