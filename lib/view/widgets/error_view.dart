import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  //final String errorMessaage;

  //ErrorPage({required this.errorMessaage});

  // getImagePath(String error) {
  //   switch (error) {
  //     case 'Bad Request':
  //       return "assets/images/Group 1.png";
  //     case 'Invalid Credentials':
  //       return "assets/images/Group 2.png";
  //     case 'Access Denied':
  //       return "assets/images/Group 3.png";
  //     case 'Page Not Found':
  //       return "assets/images/Group 4.png";
  //     case 'Internal Server Error':
  //       return "assets/images/groupfive.png";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text(
            'HELLO',
            style: TextStyle(
              fontSize: 50,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
