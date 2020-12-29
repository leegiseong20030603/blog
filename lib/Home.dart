import 'package:blog/blog.dart';
import 'package:blog/list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  BlogList blogList;
  List<Blog> list;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogList = BlogList();
    list = blogList.blogList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1),
            ),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("${list[index].title}"),
              onPressed: (){
                Get.to(list[index].page);
              },
            ),
          );
        },
      )
    );
  }
}
