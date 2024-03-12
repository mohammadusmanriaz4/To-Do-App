import 'dart:async';
import 'package:flutter/material.dart';
import 'package:schedule_task_app/Screens/Task_List_View_Screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {  
  super.initState();
    
  Timer(
  const Duration(seconds: 3), 
  () 
  {
  Navigator.push(
  context,
  MaterialPageRoute(
  builder: (context) => TaskListView(),
  ),
  ); 
  }
  );
  }
  
  
  @override
  Widget build(BuildContext context) 
  {
  return const SafeArea(
  child: Scaffold(
  body: Image(
  height: double.infinity,
  fit: BoxFit.fitHeight,
  image: AssetImage(
  'lib/assets/p1.png',
  ),
  ),
  ),
  );
  }
}