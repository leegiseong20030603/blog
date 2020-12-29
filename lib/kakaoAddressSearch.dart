import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopo/kopo.dart';

class DaumAddressSearch extends StatefulWidget {
  String title;
  DaumAddressSearch({this.title});

  @override
  _DaumAddressSearchState createState() => _DaumAddressSearchState();
}

class _DaumAddressSearchState extends State<DaumAddressSearch> {

  String address;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    address = "없음";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            height: 60,
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1),
            ),
            child: FlatButton(
              height: 60,
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text("주소 검색", textAlign: TextAlign.center,),
              onPressed: () async{
                KopoModel model = await Get.to(Kopo());
                print("검색 주소 : ${model.address}");
                setState(() {
                  this.address = model.address;
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(5, 10, 5, 0),
            alignment: Alignment.center,
            child: Text("주소 결과 : $address", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold),),
          )
        ],
      )
    );
  }
}
