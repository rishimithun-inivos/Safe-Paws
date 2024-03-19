import 'package:flutter/material.dart';
import 'package:safe_paws/view/calender_view.dart';
import 'package:safe_paws/view/dog_image_view.dart';
import 'package:safe_paws/view/splash_view.dart';
import 'package:safe_paws/view/vet_locations_view.dart';

class LinkedContainer extends StatelessWidget {
  final Icon1;
  final String DisplayText;
  final String PageName;


  const LinkedContainer({
   super.key,
   required this.Icon1,
   required this.DisplayText,
   required this.PageName,
});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => buildPage(PageName)));
          },
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(233, 233, 233, 1.0),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Icon(
                Icon1,
                color: Colors.black,
                size: 30.0,
              ),
              Text(
                DisplayText,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                  fontSize: 15,
                ),
              ),
            ],
          ),
        )
        ),);
  }

  buildPage(String PageName) {
    switch(PageName){
      case 'Near by':
        return VetLocationView();
      case 'Vaccination':
        return VaccinationView();
      case 'Calendar':
        return CalendarView();
      case 'other':
        return VetLocationView();
    }
  }
}
