import 'package:flutter/material.dart';
import 'package:drawer/drawer.dart';

class ExploreMenu extends StatelessWidget {
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
              title: new Text("Explore Menu"),
            ),
          ),
          new SliverFixedExtentList(
            itemExtent: 150.0,
            delegate:
            new SliverChildBuilderDelegate((context, index) => new ListTile(
            )),
          )
        ],
      ),
    );
  }
}