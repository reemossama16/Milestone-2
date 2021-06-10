import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/views/detailed_location_view.dart';
import 'package:test1/locations.dart';

class ExplorePage extends StatefulWidget {
  final List list;

  const ExplorePage({Key key, this.list}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List locationsList = locationsAll().listobj;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemCount: widget.list.length,
        itemBuilder: (BuildContext context, int index) => buildLocationCard(context, index,widget.list),
      ),
    );
  }

  Widget buildLocationCard(BuildContext context, int index, List locationsList){
    final location = locationsList[index];
    return new Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            new ListTile(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLocationView(location: location)),);
              },
              leading: CircleAvatar(
                radius: 30 ,
                backgroundImage: NetworkImage(location.imageurl),
              ),
              title: Text(
                location.locationName,
                style: new TextStyle(fontSize: 20),
              ),
              subtitle: Text('Theme: ${location.theme}'),
            ),
          ],
        ),
      ),
    );
  }
}