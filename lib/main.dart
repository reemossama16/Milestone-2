import 'package:flutter/material.dart';
import 'package:test1/locations.dart';
import 'package:test1/services/auth_service.dart';
import 'package:test1/services/provider_widget.dart';
import 'package:test1/views/first_view.dart';
import 'package:test1/views/navigation_view.dart';
import 'package:test1/views/sign_up_view.dart';
import 'views/explore_view.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: AuthService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Favorite Location Apps',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        // home: Home(),
        home: HomeController(list: locationsAll().listobj),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HomeController(list: locationsAll().listobj),
          '/signUp': (BuildContext context) => SignUpView(authFormType: AuthFormType.signUp,),
          '/signIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.signIn,),
          '/anonymousSignIn': (BuildContext context) => SignUpView(authFormType: AuthFormType.anonymous,),
          '/convertUser': (BuildContext context) => SignUpView(authFormType: AuthFormType.convert,),
        },
      ),
    );
  }
}

class HomeController extends StatelessWidget {
  final List list;

  const HomeController({Key key, @required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AuthService auth = Provider.of(context).auth;
    return StreamBuilder(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot){
        if(snapshot.connectionState == ConnectionState.active){
          final bool signedIn = snapshot.hasData;
          return signedIn ? Home(list: list): FirstView();
        }
        return CircularProgressIndicator();
      },
    );
  }
}