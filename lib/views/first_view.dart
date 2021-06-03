import 'package:flutter/material.dart';

class FirstView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.green,
      body: Container(
        width: _width,
        height: _height,
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: _height*0.1,),
                  Text(
                    'Welcome',
                    style: TextStyle(fontSize: 44,color: Colors.black),),
                  SizedBox(height: _height*0.15,),
                  TextButton(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed('/signUp');
                    },
                  ),
                  SizedBox(height: _height*0.05,),
                  TextButton(
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                    onPressed: (){
                      Navigator.of(context).pushReplacementNamed('/signIn');
                    },
                  )
                ],
              ),
            ),
        ),
      ),
    );
  }
}
