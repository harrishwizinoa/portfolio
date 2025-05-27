import 'package:flutter/material.dart';
import 'package:untitled1/piechart.dart';
import 'package:untitled1/progressbar.dart';
import 'package:untitled1/projects.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Harrish',
      home: Home()
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text("Flutter Developer",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "LibreBaskerville"),),
                SizedBox(height: 20,),
                Container(
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(image: AssetImage("assets/images/1000111354.png"),fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                SizedBox(height: 20,),
                Text("HARRISH",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "LibreBaskerville"),),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                  elevation: 0.5,
                    shadowColor: Colors.black45,
                    color: Colors.white24,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildProfileInfo("Name", "Harrish J"),
                          buildProfileInfo("Date of Birth", "07.01.2004"),
                          buildProfileInfo("Graduation", "Sethu Institute of Technology"),
                          buildProfileInfo("Internship", "Elysium Technology"),
                          buildProfileInfo("Experience", "1 Year(Wizinoa)"),
                          buildProfileInfo("Domain", "Flutter Developer"),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Skills",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "LibreBaskerville"),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                SizedBox(
                  height: 300,
                  child: PieChart(),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: SizedBox(
                       height: 370,
                      child: ProgressBarScreen()
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Projects",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "LibreBaskerville"),),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Center(child: Text("HRMS(Human Resource Management System)",style: TextStyle(color: Colors.white,fontSize: 15,fontFamily: "LibreBaskerville"),)),
               Projects(),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("About",style: TextStyle(color: Colors.white,fontSize: 30,fontFamily: "LibreBaskerville"),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("I\'m a passionate Flutter developer with experience in building cross-platform mobile applications.\nI enjoy turning ideas into scalable and visually appealing apps using Flutter and Dart. I\'m always eager to learn new technologies, contribute to impactful projects, and grow as a mobile app developer.",
                    style: TextStyle(color: Colors.white38,fontSize: 18,fontFamily: "DMSerifDisplay"),),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildProfileInfo(String label, String value)   {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            ":",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            flex: 6,
            child: Text(
              value,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}




