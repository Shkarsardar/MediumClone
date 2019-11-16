import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ArticleService {
  Future<void> fetchArticleList() async
  {
      // String url="http://192.168.1.2:8000/article";
      // dynamic articles=await get(url);
      // print(articles);
      SharedPreferences preferences=await SharedPreferences.getInstance();
      await preferences.remove("token");
      preferences.clear();
      print("Token has been removed");
  }
}