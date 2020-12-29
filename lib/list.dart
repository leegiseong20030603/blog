import 'package:blog/blog.dart';
import 'package:blog/kakaoAddressSearch.dart';
import 'package:blog/elasticsearch.dart';
import 'package:blog/visibility.dart';

class BlogList{

  List<Blog> blogList = [
    Blog(title: "일러스틱서치 검색", page: ElasticSearchPage(title: "일러스틱서치 검색",),),
    Blog(title: "Visibility", page: VisibilityPage(title: "Visibility",),),
    Blog(title: "카카오 주소 검색", page: DaumAddressSearch(title: "카카오 주소 검색",))
  ];
}