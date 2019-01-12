import 'package:flutter/material.dart';
import 'package:drawer/pages/restaurant_menu.dart';

class HorizontalListPopularTrending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          PopularTrending(
            image_location:
                'https://amp.businessinsider.com/images/5a7dc169d03072af008b4bf2-750-562.jpg',
            image_caption: 'Mc Donalds',
          ),
          PopularTrending(
            image_location:
                'https://img.theweek.in/content/dam/week/news/biz-tech/images/2018/4/3/dominos-pizza.jpg',
            image_caption: 'Dominos',
          ),
          PopularTrending(
            image_location:
                'https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_366,h_240,c_fill/pwd3iuk8nneghff9bsdu',
            image_caption: "Mani's Dum Biryani",
          ),
          PopularTrending(
            image_location:
                'https://amp.businessinsider.com/images/5a7dc169d03072af008b4bf2-750-562.jpg',
            image_caption: 'Mc Donalds',
          ),
          PopularTrending(
            image_location:
                'https://img.theweek.in/content/dam/week/news/biz-tech/images/2018/4/3/dominos-pizza.jpg',
            image_caption: 'Dominos',
          ),
          PopularTrending(
            image_location:
                'https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_366,h_240,c_fill/pwd3iuk8nneghff9bsdu',
            image_caption: "Mani's Dum Biryani",
          )
        ],
      ),
    );
  }
}

class PopularTrending extends StatelessWidget {
  final String image_location;
  final String image_caption;

  PopularTrending({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.5),
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new RestaurantMenu())),
          child: Container(
            width: 105.0,
            child: new Column(
              children: <Widget>[
                new Container(
                  height: 100.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      image: new DecorationImage(
                          image: new NetworkImage(image_location),
                          fit: BoxFit.cover)),
                ),
                new Text(
                  image_caption,
                  style: new TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }
}

class HorizontalListSweetTreats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SweetTreats(
            image_location:
                'https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_366,h_240,c_fill/cyka0g5ubpttfcmw1alz',
            image_caption: 'Chocolate Fantasy',
          ),
          SweetTreats(
            image_location:
                'http://cdn2.foodviva.com/static-content/food-images/diwali-recipes/gulab-jamun-milk-powder/gulab-jamun-milk-powder.jpg',
            image_caption: 'Gulab Jamun',
          ),
          SweetTreats(
            image_location:
                'http://www.oliviascuisine.com/wp-content/uploads/2016/08/tiramisu-milkshake-featured.jpg',
            image_caption: "Chocolate Milkshake",
          ),
          SweetTreats(
            image_location:
                'https://res.cloudinary.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_366,h_240,c_fill/cyka0g5ubpttfcmw1alz',
            image_caption: 'Chocolate Fantasy',
          ),
          SweetTreats(
            image_location:
                'http://cdn2.foodviva.com/static-content/food-images/diwali-recipes/gulab-jamun-milk-powder/gulab-jamun-milk-powder.jpg',
            image_caption: 'Gulab Jamun',
          ),
          SweetTreats(
            image_location:
                'http://www.oliviascuisine.com/wp-content/uploads/2016/08/tiramisu-milkshake-featured.jpg',
            image_caption: "Chocolate Milkshake",
          )
        ],
      ),
    );
  }
}

class SweetTreats extends StatelessWidget {
  final String image_location;
  final String image_caption;

  SweetTreats({this.image_location, this.image_caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(2.5),
        child: InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new RestaurantMenu())),
          child: Container(
            width: 105.0,
            child: new Column(
              children: <Widget>[
                new Container(
                  height: 160.0,
                  decoration: new BoxDecoration(
                      borderRadius: new BorderRadius.circular(5.0),
                      image: new DecorationImage(
                          image: new NetworkImage(image_location),
                          fit: BoxFit.cover)),
                ),
                new Text(
                  image_caption,
                  style: new TextStyle(fontSize: 16.0),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ));
  }
}
