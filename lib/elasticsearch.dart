import 'package:elastic_client/elastic_client.dart';
import 'package:flutter/material.dart';

class ElasticSearchPage extends StatefulWidget {

  String title;
  ElasticSearchPage({this.title});

  @override
  _ElasticSearchPageState createState() => _ElasticSearchPageState();
}

class _ElasticSearchPageState extends State<ElasticSearchPage> {

  TextEditingController index_controller, item_controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index_controller = TextEditingController();
    item_controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.title}"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: index_controller, keyboardType: TextInputType.text, decoration: InputDecoration(icon: Icon(Icons.text_fields)),),
            TextField(controller: item_controller, keyboardType: TextInputType.text, decoration: InputDecoration(icon: Icon(Icons.format_italic)),),
            RaisedButton(
              child: Text("인텍스 추가"),
              onPressed: () async {
                Uri uri = Uri.parse("http://elasticsearch.kro.kr:9200/");
                final config = HttpTransport(url: uri);
                final client = Client(config);
                String index = index_controller.value.text;
                String item = item_controller.value.text;
                await client.updateDoc(
                    index: index,
                    type: "_doc",
                    doc: {"item" : item});

                index_controller.clear();
                item_controller.clear();
              },
            ),
            RaisedButton(
              child: Text("인텍스 삭제"),
              onPressed: () async {
                Uri uri = Uri.parse("http://192.168.0.56:9200/");
                final config = HttpTransport(url: uri);
                final client = Client(config);
                String index = index_controller.value.text;
                await client.deleteIndex(index: index);
                index_controller.clear();
              },
            ),
            RaisedButton(
              child: Text("GET"),
              onPressed: () async{
                Uri uri = Uri.parse("http://192.168.0.56:9200/");
                final config = HttpTransport(url: uri);
                final client = Client(config);
                SearchResult result = await client.search(
                    index: "my_geo",
                    query: {
                      "geo_distance": {
                        "distance": "5km",
                        "location": {
                          "lat": 37.5358,
                          "lon": 126.9559
                        }
                      }
                    }
                );
                final docs = result.hits;
                for(Doc doc in docs){
                  print("검색 결과 : ${doc.doc}");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
