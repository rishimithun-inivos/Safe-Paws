import 'package:flutter/material.dart';
import 'package:safe_paws/view/vet_locations_view.dart';
import 'package:safe_paws/view/widgets/linked_container.dart';

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
            "Main Menu",
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
    child: Expanded(
        child:Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              LinkedContainer(
                  Icon1: Icons.location_on,
                  DisplayText: "Near by",
                  PageName: 'Near by',),

              SizedBox(
                width: 30,
              ),
              LinkedContainer(
                  Icon1: Icons.vaccines,
                  DisplayText: "Vaccination",
                  PageName: 'Vaccination',),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              LinkedContainer(
                  Icon1: Icons.calendar_month,
                  DisplayText: "Calendar",
                  PageName: 'Calendar',),
              SizedBox(
                width: 30,
              ),
              LinkedContainer(
                  Icon1: Icons.add,
                  DisplayText: "Other",
                  PageName: 'Other',),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(39, 130, 142, 1.0)),
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    ),
      ),
    );
  }
}
