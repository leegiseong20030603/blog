import 'package:flutter/material.dart';

class TabViewPage extends StatefulWidget {

  String title;
  TabViewPage({this.title});
  @override
  _TabViewPageState createState() => _TabViewPageState();
}

class _TabViewPageState extends State<TabViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: null,
      ),
    );
  }
}
