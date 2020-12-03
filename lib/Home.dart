import 'package:blog/test1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
        ),
        child: Center(
          child: FlatButton(
            height: 100,
            minWidth: 200,
            child: Text("페이지 이동"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: (){
              Get.to(Test1Page());
            },
          ),
        ),
      ),
    );
  }
}
