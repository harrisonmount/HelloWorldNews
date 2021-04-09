import 'dart:convert';
import 'package:hello_world/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi/newsapi.dart';




class TopNews {


  List<ArticleModel> news = [];

  Future<void> getNews() async{
    //String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=4c1be56a82844500b2184ee3c4804c49';

    var newsApi = NewsApi(
      //  dioOptions: dioOptions,
      //  interceptors: interceptors,
      debugLog: true,
      apiKey: 'foo',
    );

    newsApi.apiKey = '1562ed02072f49a193518d143d65603d';

    ArticleResponse topHeadlines = await newsApi.topHeadlines(
      //    country: country,
      //    category: category,
      //    sources: sources,
      //    q: q,
      language: 'en',
      //    pageSize: pageSize,
      //    page: page,
    );

    if(topHeadlines.status){

      topHeadlines.articles.forEach((element){

        if(element.urlToImage != null && element.description != null){

          ArticleModel articleModel = ArticleModel(

              title: element.title,
              author: element.author,// HE USES DOUBLE QUOTES
              description: element.description,
              url: element.url,
              urlToImage: element.urlToImage,
              content: element.content
          );

          news.add(articleModel);
        }

      });
    }
  }
}

class QueriedNews{

  Future<void> getNews() async {
    var newsApi = NewsApi(
      //  dioOptions: dioOptions,
      //  interceptors: interceptors,
      debugLog: true,
      apiKey: 'foo',
    );

    newsApi.apiKey = '1562ed02072f49a193518d143d65603d';
    ArticleResponse everything = await newsApi.everything(
      //q: 'flutter',
      //    qInTitle: qInTitle,
      //    sources: sources,
      //    domains: domains,
      //    excludeDomains: excludeDomains,
      //    from: from, // support DateTime or String
      //    to: to, // support DateTime or String
      //    language: language,
      //    sortBy: sortBy,
      //    pageSize: pageSize,
      //    page: page,
    );
    //print(everything);
  }
/*
  SourceResponse sources = await newsApi.sources(
  //    category: category,
  //    language: language,
  //    country: country,
  );
  print(sources);
}
   */
}


class CategoryNewsClass{
  List<ArticleModel> news = [];

  Future<void> getNews(String category) async{
    var newsApi = NewsApi(
      //  dioOptions: dioOptions,
      //  interceptors: interceptors,
      debugLog: true,
      apiKey: 'foo',
    );

    newsApi.apiKey = '1562ed02072f49a193518d143d65603d';

    ArticleResponse queried = await newsApi.topHeadlines(
      //    country: country,
      category: category,
      //    sources: sources,
      //    q: q,
      language: 'en',
      //    pageSize: pageSize,
      //    page: page,
    );

    if(queried.status) {
      queried.articles.forEach((element) {
        if (element.urlToImage != null && element.description != null) {
          ArticleModel articleModel = ArticleModel(

              title: element.title,
              author: element.author,
              // HE USES DOUBLE QUOTES
              description: element.description,
              url: element.url,
              urlToImage: element.urlToImage,
              content: element.content
          );

          news.add(articleModel);
        }
      });
    }
  }
}




/*
class News {
  List<ArticleModel> news = [];
  Future<void> getNews() async{
    //String url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=4c1be56a82844500b2184ee3c4804c49';
    var url = Uri.https('www.newsapi.org',
        '/v2/top-headlines?country=us&category=business&apiKey=1562ed02072f49a193518d143d65603d', {'q': '{http}'});
    var response = await http.get(url);
    print("jsonData 1: ");
    print(response.statusCode.toString());
    print(response.body.toString());
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
 */

/*
class CategoryNewsClass {
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async{
    //String url = 'https://newsapi.org/v2/everything?q=$category&apiKey=4c1be56a82844500b2184ee3c4804c49';
    var url = Uri.https('www.newsapi.org','/v2/top-headlines?country=us&category=business&apiKey=1562ed02072f49a193518d143d65603d', {'q': '{http}'});
    var response = await http.get(url);
    //print(response);
    print("jsonData 2: ");
    print(response.toString());
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
 */