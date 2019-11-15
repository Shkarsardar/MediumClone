import 'package:http/http.dart';
class ArticleService {
  Future<Map> fetchArticleList() async
  {
      String url="http://192.168.1.2:8000/article";
      dynamic articles=await get(url);
      print(articles);
  }
}