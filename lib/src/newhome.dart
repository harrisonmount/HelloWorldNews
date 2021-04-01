import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hello_world/helper/auth_service.dart';
import 'package:hello_world/helper/data.dart';
import 'package:hello_world/helper/news.dart';
import 'package:hello_world/models/article_model.dart';
import 'package:hello_world/models/category_model.dart';
import 'package:hello_world/src/category_news.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'article_view.dart';

class newHome extends StatefulWidget {
  @override
  _newHomeState createState() => _newHomeState();
}

class _newHomeState extends State<newHome> {

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async{
    TopNews newsClass = TopNews();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false; //Loading has stopped
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text("sign out"),
              ),
              Text("Hello"),
              Text("News", style: TextStyle(
                  color: Colors.blueGrey
              ),)
            ],
          ),
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.save)),
            )
          ],
          centerTitle: true,
          elevation: 0.5,
        ),
        body: _loading ? Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        ) : Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Container(
                      height: 70,
                      child: ListView.builder(
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index){
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      )
                  ),
                  CarouselSlider(
                    options: CarouselOptions(
                      enableInfiniteScroll: false,
                      height: 700,
                      scrollDirection: Axis.vertical,
                    ),
                    items: articles.map((item) => GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => ArticleView(
                                  blogUrl: item.url
                              )
                          ));
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Stack(
                              children:[
                                Image.network(
                                  item.urlToImage,
                                  fit: BoxFit.fitHeight,
                                  height: 500,
                                ),
                                Container(
                                    height: 500,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [Colors.transparent, Colors.grey],
                                        )
                                    )
                                ),
                                Container(
                                  child: Align(
                                    child: Text(item.title)
                                  )
                                )
                              ]
                          )
                        ),
                    )
                    ).toList(),
                  )
                ],
              ),
        )
    );
  }
}

class CategoryTile extends StatelessWidget {

  final imageUrl, categoryName;
  CategoryTile({this.imageUrl, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => CategoryNews(
                category: categoryName.toLowerCase(),
              )
          ));
        },
        child: Container(
            margin: EdgeInsets.only(right: 16),
            child: Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl, width: 120, height: 60, fit: BoxFit.cover,
                    )
                ),
                Container(
                  alignment:  Alignment.center,
                  width: 120,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black26,
                  ),
                  child: Text(categoryName, style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),),
                )
              ],
            )
        )
    );
  }
}

class BlogTile extends StatelessWidget {

  final String imageUrl, title, desc, url;
  BlogTile({@required this.imageUrl,@required  this.title,@required  this.desc,@required this.url,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => ArticleView(
                  blogUrl: url
              )
          ));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 16),
          child: Column(
            children: <Widget> [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl),
              ),
              SizedBox(height: 8,),
              Text(title, style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),),
              SizedBox(height: 8,),
              Text(desc, style: TextStyle(
                color: Colors.black54,
              ),)
            ],
          ),
        )
    );
  }
}