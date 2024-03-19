import 'package:flutter/material.dart';
import 'package:safe_paws/view/splash_view.dart';

void main() {
  runApp(MyApp());
}

final navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}