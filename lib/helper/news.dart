import 'dart:convert';
import 'package:hello_world/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async{
    String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=4c1be56a82844500b2184ee3c4804c49";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){

      jsonData["articles"].forEach((element){

        if(element["urlToImage"] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(

            title: element['title'],
            author: element['author'],// HE USES DOUBLE QUOTES
            description: element['description'],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"]
          );

          news.add(articleModel);
        }


      });
    }
  }
}