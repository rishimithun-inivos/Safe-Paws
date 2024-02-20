import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(39, 130, 142, 1.0),
        elevation: 5,
        shadowColor: Colors.grey,
        centerTitle: true,
        title: Center(
          child: Text(
            "Dog Image Collections",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
