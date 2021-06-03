import 'package:flutter/material.dart';
import 'package:test1/main.dart';
import 'package:test1/services/provider_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/models/Location.dart';
import 'package:test1/locations.dart';


class newLocationView extends StatefulWidget {
  final List list;
  const newLocationView({Key key, this.list}) : super(key: key);
  @override
  _newLocationViewState createState() => _newLocationViewState();
}

class _newLocationViewState extends State<newLocationView> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = new TextEditingController();
    TextEditingController _themeController = new TextEditingController();
    TextEditingController _fullDescController = new TextEditingController();
    TextEditingController _imageurlController = new TextEditingController();
    TextEditingController _locationurlController = new TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Add a new location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 10,
                width: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.green)),
                    labelText: "Location Name",
                    hintText: "Location Name"),
                controller: _nameController,
                autofocus: true,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.green)),
                    labelText: "Location Theme",
                    hintText: "Location Theme"),
                controller: _themeController,
                autofocus: true,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.green)),
                    labelText: "Location Full Description",
                    hintText: "Location Full Description"),
                controller: _fullDescController,
                autofocus: true,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.green)),
                    labelText: "Location Image URL",
                    hintText: "Location Image URL"),
                controller: _imageurlController,
                autofocus: true,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: Colors.green)),
                    labelText: "Location URL",
                    hintText: "Location URL"),
                controller: _locationurlController,
                autofocus: true,
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              ElevatedButton(
                  child: Text('Add to Explore'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Location loc = new Location(
                        id: (widget.list.length)+1,
                        locationName: _nameController.text,
                        fullDesc: _fullDescController.text,
                        imageurl: _imageurlController.text,
                        locationurl: _locationurlController.text,
                        theme: _themeController.text,
                      );
                      widget.list.add(loc);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeController(list: widget.list)),
                            (Route<dynamic> route) => false,
                      );
                      // Navigator.of(context).pop();
                    }
                  }
              ),
              SizedBox(
                height: 10,
                width: 10,
              ),
              ElevatedButton(
                  child: Text('Add to Firebase'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      //save data to firebase
                      Location loc = new Location(
                        locationName: _nameController.text,
                        fullDesc: _fullDescController.text,
                        imageurl: _imageurlController.text,
                        locationurl: _locationurlController.text,
                        theme: _themeController.text,
                      );
                      final uid = await Provider.of(context).auth.getCurrentUID();

                      await (Firestore.instance)
                          .collection('userData')
                          .document(uid)
                          .collection('favorites')
                          .add(loc.toJson());

                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
