import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:hello_world/helper/auth_service.dart';
import 'package:hello_world/helper/data.dart';
import 'package:hello_world/helper/news.dart';
import 'package:hello_world/models/article_model.dart';
import 'package:hello_world/models/category_model.dart';
import 'package:hello_world/src/category_news.dart';
import 'package:hello_world/src/search_news.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'article_view.dart';
import 'package:hello_world/src/OnBoarding.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class newHome extends StatefulWidget {

  newHome({Key key, @required this.filterinput}) : super(key: key);
  final List<String> filterinput;

  @override
  _newHomeState createState() => _newHomeState();
}

class _newHomeState extends State<newHome> {

  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  final searchcontroller = new TextEditingController();

  String _search = '';

  bool _loading = true;
  @override
  void initState() {
    // TODO: implement initState
    categories = getCategories();
    getNews();
    print(widget.filterinput);

    super.initState();
  }

  getNews() async{
    TopNews newsClass = TopNews();
    await newsClass.getNews();
    articles = newsClass.news;



    /*await Future.wait(fruits
        .map((fruit) => Utils.cacheImage(context, fruit.urlImage))
        .toList());*/

    setState(() {
      _loading = false; //Loading has stopped
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Scaffold.of(context).openDrawer(),
            )
        ),
        //automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Hello"),
            Text("News", style: TextStyle(
                color: Colors.blueGrey
            ),)
          ],
        ),
        centerTitle: true,
        elevation: 0.5,
      ),
      drawer: Container(
        width: 350,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('Search', style: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: searchcontroller,
                  //onSubmitted: ,
                  onSubmitted: (text){
                    this.setState((){
                      _search = text;//when state changed
                      print(_search);
                    });
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => SearchNews(
                          search: _search.toLowerCase(),
                        )
                    ));
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    hintText: 'Topics, People, etc...',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[

            Container(
              height: 100,
              child: DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => OnBoarding())
                  );
                },
                child: Text("Change Interests"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthenticationService>().signOut();
                },
                child: Text("Sign Out"),
              ),
            ),
            /*StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Users').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Loading...');
                return ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    return Text(snapshot.data.documents[index]);
                  }
                );
              }
            )*/
            
            
            
            //Text(widget.filterinput[0]),
            /*ListView(
                children: [for (int x  = 1;  x < widget.filterinput.length; x++)
                  Text(widget.filterinput[x]),
            ],),*/
          ],
        ),
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

                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child:
                    CarouselSlider(
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        height: MediaQuery.of(context).size.height * 0.78,
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
                                    height: MediaQuery.of(context).size.height * 0.78,
                                  ),
                                  Container(
                                    //GRADIENT OVERLAY ON PICTURE
                                      height: MediaQuery.of(context).size.height * 0.78,
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