import 'package:flutter/material.dart';
import 'package:test1/services/auth_service.dart';
import 'package:test1/services/provider_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/models/Location.dart';
import 'package:test1/locations.dart';

class newLocationView extends StatefulWidget {
  const newLocationView({Key key}) : super(key: key);

  @override
  _newLocationViewState createState() => _newLocationViewState();
}

class _newLocationViewState extends State<newLocationView> {
  List l = new List();
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
                        borderSide: new BorderSide(color: Colors.blue)),
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
                        borderSide: new BorderSide(color: Colors.blue)),
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
                        borderSide: new BorderSide(color: Colors.blue)),
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
                        borderSide: new BorderSide(color: Colors.blue)),
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
                        borderSide: new BorderSide(color: Colors.blue)),
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
                  child: Text('Add'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Location loc = Location(
                        id: ((locationsAll().listobj[(locationsAll().listobj.length) - 1].id) + 1),
                        locationName: _nameController.text,
                        fullDesc: _fullDescController.text,
                        imageurl: _imageurlController.text,
                        locationurl: _locationurlController.text,
                        theme: _themeController.text,
                      );
                      l.add(loc);
                      l.addAll(locationsAll().listobj);

                      for (int i = 0; i < l.length; i++) {
                        print(l[i].toJson());
                      }

                      Navigator.of(context).setState(() {
                        locationsAll().listobj = l;
                      });

                      Navigator.of(context).popUntil((route) => route.isFirst);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
