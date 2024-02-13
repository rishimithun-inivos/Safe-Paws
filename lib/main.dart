import 'package:flutter/material.dart';
import 'package:safe_paws/view/dog_image_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DogImageView(),
    );
  }
}