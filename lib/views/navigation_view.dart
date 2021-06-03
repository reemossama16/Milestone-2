import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test1/services/auth_service.dart';
import 'package:test1/views/explore_view.dart';
import 'package:test1/models/Location.dart';
import 'package:test1/services/provider_widget.dart';
import '../locations.dart';
import 'home_view.dart';
import 'newLocation.dart';

class Home extends StatefulWidget {
  final List list;

  const Home({Key key, this.list}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      HomeView(),
      ExplorePage(list: widget.list),
    ];
    final newLocation = new Location(id: null, locationName: null, theme: null, fullDesc: null, imageurl: null, locationurl: null);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          tooltip: 'Add new location',
          backgroundColor: Colors.green,
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => newLocationView(list: widget.list),));
          }
      ),
      appBar: AppBar(
        title: Text('Favorite Location App',),
        backgroundColor: Colors.green,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.logout),
              tooltip: 'Sign Out',
              onPressed: ()async{
                try{
                  AuthService auth = Provider.of(context).auth;
                  await auth.signOut();
                }catch(e){
                  print(e);
                }
              }
          ),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            tooltip: "User's Locations",
            icon: new Icon(Icons.home_outlined),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            tooltip: 'Suggested Locations',
            icon: new Icon(Icons.explore_outlined),
            title: new Text('Explore'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }
}
