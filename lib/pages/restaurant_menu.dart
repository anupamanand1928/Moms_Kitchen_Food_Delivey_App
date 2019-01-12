import 'package:flutter/material.dart';
import 'package:drawer/drawer.dart';

class RestaurantMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new CustomScrollView(
        slivers: <Widget>[
          new SliverAppBar(

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
            backgroundColor: Colors.green,
            expandedHeight: 250.0,
            floating: false,
            pinned: true,
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text("Restaurant Name"),
              background: new Container(
                height: 100.0,
                decoration: new BoxDecoration(
                    color: const Color(0xff7c94b6),
                    image: new DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.6), BlendMode.dstATop),
                        image: new NetworkImage(
                          'http://bookhoteling.com/wp-content/uploads/2016/06/restaurants-near-me.jpg',
                        ))),
              ),

            ),

          ),
          new SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: new SliverChildBuilderDelegate(
                (context, index) => new ListTile()),
          )
        ],
      ),
    );
  }
}
