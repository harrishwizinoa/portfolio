import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: screenHeight * 0.35,
            width: screenWidth * 0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage("assets/images/1000111354.png"),fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          SizedBox(width: 20,),
          Container(
            height: 300,
            width: screenWidth * 0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage("assets/images/1000111354.png"),fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Container(
            height: 300,
            width: screenWidth * 0.35,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(image: AssetImage("assets/images/1000111354.png"),fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
