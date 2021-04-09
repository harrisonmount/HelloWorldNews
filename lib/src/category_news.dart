import 'package:flutter/material.dart';
import 'package:hello_world/helper/news.dart';
import 'package:hello_world/models/article_model.dart';
import 'package:hello_world/src/article_view.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CategoryNews extends StatefulWidget {

  final String category;

  CategoryNews({this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState(){
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async{
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles = newsClass.news;
    setState(() {
      _loading = false; //Loading has stopped
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello", style: TextStyle(
              color: Colors.black
            ),),
            Text('${widget.category[0].toUpperCase()}${widget.category.substring(1)}', style: TextStyle(
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
        elevation: 0.0,
      ),
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ) : SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
          children: <Widget> [
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child:
                CarouselSlider(
                  options: CarouselOptions(
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    height: MediaQuery.of(context).size.height * 0.85,
                    viewportFraction: 1,
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
                                height: MediaQuery.of(context).size.height * 0.85,
                              ),
                              Container(
                                //GRADIENT OVERLAY ON PICTURE
                                  height: MediaQuery.of(context).size.height * 0.85,
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        stops:[0.55,0.90],
                                        colors: [Colors.transparent, Colors.black87],
                                      )
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  child:
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(item.title, style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),),
                                      SizedBox(height: 8),
                                      Text(item.description, style: TextStyle(
                                        color: Colors.white,
                                      ),),
                                      SizedBox(height: 12),
                                    ],
                                  )
                              ),
                            ]
                        )
                    ),
                  )
                  ).toList(),
                )
            ),
            ],
          ),
        ),
      ),
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
