import 'package:blog/scroll.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test1Page extends StatefulWidget {
  @override
  _Test1PageState createState() => _Test1PageState();
}

class _Test1PageState extends State<Test1Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FlatButton(
            height: 100,
            minWidth: 200,
            child: Text("스크롤 페이지 이동"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: (){
              Get.to(ScrollPage());
            },
          ),
        ),
      ),
    );
  }
}
