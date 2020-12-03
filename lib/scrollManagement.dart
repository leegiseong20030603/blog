import 'package:flutter/cupertino.dart';

class ScrollManagement extends ChangeNotifier{

  List<int> cache = [];
  bool isLoading = false;
  bool hasMore = true;

  Future<List<int>>counter({@required int nextIndex}) async{
    assert(nextIndex != null);

    /// 통신부분 가정
    await Future.delayed(Duration(seconds: 1));

    if(nextIndex >= 100){
      return [];
    }

    return List.generate(10, (index) => index + nextIndex);
  }

  fetch({@required int nextIndex}) async{
    nextIndex ??= 0;

    /// 로딩 ON
    isLoading = true;
    notifyListeners();

    /// 데이터 불러오기
    final items = await counter(nextIndex: nextIndex);

    /// 불러온 데이터 리스트 기존 데이터 리스트에 붙이기
    this.cache = [
      ...this.cache,
      ...items,
    ];

    /// 아이탬이 더이상 없을 때
    if(items.length == 0){
      hasMore = false;
    }

    /// 로딩 OFF
    isLoading = false;
    notifyListeners();
  }

}