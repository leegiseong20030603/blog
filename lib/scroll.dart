import 'package:blog/scrollManagement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ScrollPage extends StatefulWidget {
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {

  @override
  void initState() {
    super.initState();
    Future.microtask((){
      Provider.of<ScrollManagement>(context, listen: false).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  Widget _body(){
    final provider = Provider.of<ScrollManagement>(context);
    //
    final cache = provider.cache;

    final isLoading = provider.isLoading;

    if(isLoading && cache.length == 0){
      return Center(
        child: _loading(),
      );
    }

    if(!isLoading && cache.length == 0){
      return _notMore();
    }

    return Container(
      child: ListView.builder(
        itemCount: cache.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < cache.length) {
            return FlatButton(
              onPressed: () {
                print("$index");
              },
              child: ListTile(
                title: Text("$index"),
              ),
            );
          }

          if (index >= 100) {
            return _notMore();
          }

          if (!provider.isLoading && provider.hasMore) {
            Future.microtask(() {
              provider.fetch(nextIndex: index);
            });
          }

          if (provider.hasMore) {
            return _loading();
          } else {
            return _notMore();
          }
        },
      ),
    );
  }

  Widget _loading(){
    return Container(margin: EdgeInsets.fromLTRB(0, 1, 1, 0),child: Center(child: CircularProgressIndicator(),));
  }

  Widget _notMore(){
    return Center(child: Text("학원 검색 결과가 더이상 없습니다...."),);
  }
}

