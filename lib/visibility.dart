import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VisibilityPage extends StatefulWidget {
  String title;
  VisibilityPage({this.title});

  @override
  _VisibilityPageState createState() => _VisibilityPageState();
}

class _VisibilityPageState extends State<VisibilityPage> {

  String statusMessage;
  bool status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statusMessage = "나타내기";
    status = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace_outlined),
          onPressed: (){
            Get.back();
          },
        ),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            status ? Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ) : Container(),
            Center(
              child: RaisedButton(
                child: Text("$statusMessage", textAlign: TextAlign.center,),
                onPressed: (){
                  setState(() {
                    status = !status;
                    if(status){
                      statusMessage = "숨기기";
                    }else{
                      statusMessage = "나타내기";
                    }
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
