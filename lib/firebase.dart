import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:drawer/pages/restaurant_menu.dart';

void main() => runApp(MyApp());

final dummySnapshot = [
  {"restname": "Mani's Dum Biryani", "rating": 155},
  {"restname": "Ovenstory Pizza", "rating": 14},
  {"restname": "Richard", "rating": 11},
  {"restname": "Ike", "rating": 10},
  {"restname": "Justin", "rating": 1},


];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    // TODO: get actual snapshot from Cloud Firestore
    return _buildList(context, dummySnapshot);
  }

  Widget _buildList(BuildContext context, List<Map> snapshot) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: snapshot.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Map data) {
    final record = Record.fromMap(data);

    return Padding(
      key: ValueKey(record.restname),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
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
                              image: new NetworkImage(record.restname),
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
                                record.restname,
                                style: new TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: new Text(
                                record.restname,
                                style: new TextStyle(fontSize: 10.0),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            new Text(
                              "∙ " + record.restname,
                              style: new TextStyle(fontSize: 12.0),
                              textAlign: TextAlign.end,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: new Text(
                                record.restname,
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
                                "* " + record.restname,
                                style: new TextStyle(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: new Text(
                                record.restname + " Review",
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
      )

    );
  }
}

class Record {
  final String restname;
  final int rating;
  final DocumentReference reference;

  Record.fromMap(Map<String, dynamic> map, {this.reference})
      : assert(map['restname'] != null),
        assert(map['rating'] != null),
        restname = map['restname'],
        rating = map['rating'];

  Record.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Record<$restname:$rating>";
}