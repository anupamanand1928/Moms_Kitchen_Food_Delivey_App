import 'package:flutter/material.dart';
import 'dart:async';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:drawer/components/horizontal_listview.dart';
import 'package:drawer/pages/restaurant_menu.dart';
import 'package:drawer/drawer.dart';
import 'package:drawer/pages/explore_menu.dart';

void main() => runApp(new MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => runApp(MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.fastfood,
                          color: Colors.deepOrange,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        " Moms",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Kitchen",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text("Online Kitchen \n For Everyone",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  var title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          title: const Text('Moms Kitchen'),
          backgroundColor: Colors.green,
          actions: <Widget>[
            new IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {}),
            new IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
                onPressed: () {})
          ],
        ),
        body: SimpleWidget(),
        //makeTabBarView(<Widget>[SimpleWidget(), TheGridView()]),
        drawer: Navigation(),
      ),
    );
  }
}

class SimpleWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SimpleWidget> {
  int _bottomNavBarIndex = 0;

  Home home;
  AllRestaurant allRestaurant;
  Order order;

  List<Widget> pages;
  Widget currentPage;

  @override
  void initState() {
    home = Home();
    allRestaurant = AllRestaurant();
    order = Order();
    pages = [home, allRestaurant, order];

    currentPage = home;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _bottomNavBarIndex,
          onTap: (int index) {
            setState(() {
              _bottomNavBarIndex = index;
              currentPage = pages[index];
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu),
                title: Text("All Restaurant")),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), title: Text("My Order"))
          ],
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var title = '';

  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      width: 360.0,
      height: 175.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          NetworkImage(
              'http://www.desilootera.com/wp-content/uploads/2017/08/Foodpanda-Get-FLAT-50-Off-Upto-Rs.110-on-Your-First-Order-From-App-1024x461.jpg'),
          NetworkImage(
              'https://asia-public.foodpanda.com/marketing/production/in/images/nl/2017/ravinder/july/25/Foodpand_SRK_launch/1100x350_main_kv_new01.jpg'),
          NetworkImage(
              'https://cdn.static-zoutons.com/images/originals/blog/foodpandawalletoffers_1521811077.jpg'),
          NetworkImage(
              'https://i1.wp.com/inc42.com/wp-content/uploads/2015/03/tastykhana-foodpanda-e1426668971264.jpg?fit=690%2C386&ssl=1'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );
    return Scaffold(
        body: new ListView(
      children: <Widget>[
        image_carousel,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: new Container(
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        "Explore",
                        style: new TextStyle(
                          fontSize: 20.0,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                              new MaterialPageRoute(
                                  builder: (context) => new ExploreMenu())),
                          child: Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                color: Color(0xFFFD7384)),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.drive_eta,
                                  color: Colors.white,
                                ),
                                new Text("Motor",
                                    style: new TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                        ),
                      )),
                      new Expanded(
                          child: Container(
                        height: 100.0,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 2.5, right: 2.5),
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new ExploreMenu())),
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                        color: Color(0xFF2BD093),
                                        borderRadius:
                                            new BorderRadius.circular(5.0)),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: new Icon(
                                            Icons.local_offer,
                                            color: Colors.white,
                                          ),
                                        ),
                                        new Text(
                                          "Classified",
                                          style:
                                              new TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 2.5, right: 2.5),
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new ExploreMenu())),
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                        color: Color(0xFFFC7B4D),
                                        borderRadius:
                                            new BorderRadius.circular(5.0)),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: new Icon(
                                            Icons.beenhere,
                                            color: Colors.white,
                                          ),
                                        ),
                                        new Text(
                                          "Service",
                                          style:
                                              new TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                      new Expanded(
                          child: Container(
                        height: 100.0,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.5, bottom: 2.5),
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new ExploreMenu())),
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                        color: Color(0xFF53CEDB),
                                        borderRadius:
                                            new BorderRadius.circular(5.0)),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: new Icon(
                                            Icons.account_balance,
                                            color: Colors.white,
                                          ),
                                        ),
                                        new Text(
                                          "Properties",
                                          style:
                                              new TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 2.5, top: 2.5),
                                child: InkWell(
                                  onTap: () => Navigator.of(context).push(
                                      new MaterialPageRoute(
                                          builder: (context) =>
                                              new ExploreMenu())),
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                        color: Color(0xFFF1B069),
                                        borderRadius:
                                            new BorderRadius.circular(5.0)),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: new Icon(
                                            Icons.art_track,
                                            color: Colors.white,
                                          ),
                                        ),
                                        new Text(
                                          "Jobs",
                                          style:
                                              new TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                          child: Text(
                        "Popular Trending",
                        style: new TextStyle(fontSize: 18.0),
                      )),
                      new Expanded(
                          child: Text(
                        "View All",
                        style: new TextStyle(color: Color(0xFF2BD093)),
                        textAlign: TextAlign.end,
                      )),
                    ],
                  ),
                ),
                Row(),
                new SizedBox(
                  height: 10.0,
                ),
                HorizontalListPopularTrending(),
                new SizedBox(
                  height: 5.0,
                ),
                new Divider(),
                new SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                          child: Text(
                        "Sweet Treats",
                        style: new TextStyle(fontSize: 18.0),
                      )),
                      new Expanded(
                          child: Text(
                        "View All",
                        style: new TextStyle(color: Color(0xFF2BD093)),
                        textAlign: TextAlign.end,
                      )),
                    ],
                  ),
                ),
                Row(),
                new SizedBox(
                  height: 10.0,
                ),
                HorizontalListSweetTreats(),
                new SizedBox(
                  height: 5.0,
                ),
                new Divider(),
                new SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                          child: Text(
                        "Night Outs",
                        style: new TextStyle(fontSize: 18.0),
                      )),
                      new Expanded(
                          child: Text(
                        "View All",
                        style: new TextStyle(color: Color(0xFF2BD093)),
                        textAlign: TextAlign.end,
                      )),
                    ],
                  ),
                ),
                Row(),
                new SizedBox(
                  height: 10.0,
                ),
                HorizontalListPopularTrending(),
                new SizedBox(
                  height: 5.0,
                ),
                new Divider(),
                new SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                          child: Text(
                        "Explore your favourite cuisines",
                        style: new TextStyle(fontSize: 12.0),
                      )),
                      new Expanded(
                          child: Text(
                        "View All",
                        style: new TextStyle(color: Color(0xFF2BD093)),
                        textAlign: TextAlign.end,
                      )),
                    ],
                  ),
                ),
                Row(),
                new SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                          child: Container(
                        height: 90.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              height: 80.0,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  image: new DecorationImage(
                                      image: new NetworkImage(
                                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRIVphPNZMyZl2uLi12b81Fyubc2OXLST0L2-Bj4K4bo0lIq2A-EQ'),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      )),
                      new SizedBox(
                        width: 10.0,
                      ),
                      new Expanded(
                          child: Container(
                        height: 90.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              height: 80.0,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  image: new DecorationImage(
                                      image: new NetworkImage(
                                          'https://static.independent.co.uk/s3fs-public/thumbnails/image/2017/02/07/15/chinese.jpg?w968h681'),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                          child: Container(
                        height: 90.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              height: 80.0,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  image: new DecorationImage(
                                      image: new NetworkImage(
                                          'http://assets.limetray.com/assets/user_images/content_images/original/about-3.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      )),
                      new SizedBox(
                        width: 10.0,
                      ),
                      new Expanded(
                          child: Container(
                        height: 90.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              height: 80.0,
                              decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.circular(5.0),
                                  image: new DecorationImage(
                                      image: new NetworkImage(
                                          'https://img.theweek.in/content/dam/week/news/biz-tech/images/2018/4/3/dominos-pizza.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 5.0,
                ),
                new Divider(),
                new SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    children: <Widget>[
                      new Expanded(
                          child: Text(
                        "Popular Trending",
                        style: new TextStyle(fontSize: 18.0),
                      )),
                      new Expanded(
                          child: Text(
                        "View All",
                        style: new TextStyle(color: Color(0xFF2BD093)),
                        textAlign: TextAlign.end,
                      )),
                    ],
                  ),
                ),
                Row(),
                new SizedBox(
                  height: 10.0,
                ),
                HorizontalListPopularTrending(),
                new SizedBox(
                  height: 100.0,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

/*class RestaurantPOJO{
  String R_Name;
  String get RestName() => R_Name;
  String R_Type;
  String get RestType() => R_Type;
  String R_Offer;
  String get RestOffer() => R_Offer;
  String R_Img;
  String get RestImg() => R_Img;
  String R_Review;
  String get RestReview() => R_Review;
  String R_Rating;
  String get RestRating() => R_Rating;

}*/

class AllRestaurant extends StatelessWidget {
  List<String> RestImg = [
    "https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_366,h_240,c_fill/pwd3iuk8nneghff9bsdu",
    "https://assets.faasos.io/ovenstory-react.in/production/meta-img.jpg",
    "https://im1.dineout.co.in/images/uploads/restaurant/sharpen/4/k/t/p4116-15178957365a7940386335c.jpg?w=1200",
    "http://static.businessworld.in/article/article_extra_large_image/1482910154_y1PQQ1_faaso.jpg",
    "http://assets.limetray.com/assets/user_images/content_images/original/about-3.jpg"
  ];
  List<String> RestName = [
    "Mani's Dum Biryani",
    'Ovenstory Pizza',
    'Sweet Truth',
    'Fassos',
    'Meghana Biryani',
  ];
  List<String> RestRating = [
    "4.3",
    "4.0",
    "4.2",
    "4.1",
    "4.8",
  ];
  List<String> RestItem = [
    "Biryani, North Indian, Kebab",
    "Pizza, Ice creams, Desserts",
    "Desserts, Ice creams",
    "Fast Food, Tea-Coffee, Snacks",
    "Biryani, North Indian, Kebab"
  ];
  List<String> RestOffer = [
    "30% Off",
    "Rs 150 Off",
    "No offer",
    "40% Off",
    "50% Off",
  ];
  List<String> RestReview = ["629", "535", "65", "8894", "6563"];
  List<String> RestCond = [
    "No min order ∙ 40 mins",
    "No min order ∙ 40 mins",
    "No min order ∙ 40 mins",
    "No min order ∙ 40 mins",
    "No min order ∙ 40 mins"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new ListView.builder(
          itemBuilder: (_, int index) => Restaurant(
              this.RestName[index],
              this.RestRating[index],
              this.RestItem[index],
              this.RestOffer[index],
              this.RestReview[index],
              this.RestImg[index],
              this.RestCond[index]),
          itemCount: this.RestName.length,
        ),
      ),
    );
  }
}

class Restaurant extends StatelessWidget {
  final String restname;
  final String restrating;
  final String restitem;
  final String restoffer;
  final String restreview;
  final String restimg;
  final String restcond;

  Restaurant(this.restname, this.restrating, this.restitem, this.restoffer,
      this.restreview, this.restimg, this.restcond);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new SizedBox(
            height: 12.0,
          ),
          InkWell(
            onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (context) => new RestaurantMenu())),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 25.0),
                  child: new Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(5.0),
                        image: new DecorationImage(
                            image: new NetworkImage(restimg),
                            fit: BoxFit.cover)),
                  ),
                ),
                new Expanded(
                    child: Container(
                  height: 100.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: new Text(
                          restname,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new Text(
                          restitem,
                          style: new TextStyle(fontSize: 10.0),
                          textAlign: TextAlign.end,
                        ),
                      ),
                      new Text(
                        "∙ " + restcond,
                        style: new TextStyle(fontSize: 12.0),
                        textAlign: TextAlign.end,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: new Text(
                          restoffer,
                          style: new TextStyle(color: Color(0xFF2BD093)),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                )),
                new Expanded(
                    child: Container(
                  height: 100.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: new Text(
                          "* " + restrating,
                          style: new TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new Text(
                          restreview + " Review",
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
          new Divider(),
        ],
      ),
    );
  }
}

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new SizedBox(
            height: 12.0,
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 18.0, right: 18.0, bottom: 35.0),
                child: new Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      image: new DecorationImage(
                          image: new NetworkImage(
                              'https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_366,h_240,c_fill/pwd3iuk8nneghff9bsdu'),
                          fit: BoxFit.cover)),
                ),
              ),
              new Expanded(
                  child: Container(
                height: 100.0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new Text(
                        'Rasoi Pure Vegeterian',
                        style: new TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: new Text(
                        "Ordered at 20 Nov 2018 at 9:10 PM",
                        style: new TextStyle(fontSize: 10.0),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    new Divider(),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new Text(
                        "Total : Rs.127.42",
                        style: new TextStyle(color: Color(0xFF2BD093)),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              )),
            ],
          ),
          new Divider(),
        ],
      ),
    );
  }
}

