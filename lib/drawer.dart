import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Anupam Anand"),
              accountEmail: new Text("anupam.ananddilu@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTix1BMhh2rak85wsq39yAQ6NnCneS1EjXlT8rFd1Ivo804jd23"),
              ),
              decoration: new BoxDecoration(color: Colors.green),
            ),
            InkWell(
              onTap: () {}, // => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=>new RestaurantMenu()))
              child: new ListTile(
                leading: new Icon(
                  Icons.home,
                  color: Colors.green,
                ),
                title: new Text('Restaurants'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: new ListTile(
                leading: new Icon(
                  Icons.assessment,
                  color: Colors.green,
                ),
                title: new Text('My Orders'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: new ListTile(
                leading: new Icon(
                  Icons.account_balance_wallet,
                  color: Colors.green,
                ),
                title: new Text('Wallet'),
                subtitle: const Text('Rs. 100'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: new ListTile(
                leading: new Icon(
                  Icons.build,
                  color: Colors.green,
                ),
                title: new Text('Settings'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: new ListTile(
                leading: new Icon(
                  Icons.streetview,
                  color: Colors.green,
                ),
                title: new Text('Support'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: new ListTile(
                leading: new Icon(
                  Icons.help,
                  color: Colors.blue,
                ),
                title: new Text('About'),
              ),
            ),
          ],
        ));
  }
}
