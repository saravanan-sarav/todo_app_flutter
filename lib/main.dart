import 'package:flutter/material.dart';
import 'package:todo_app/app_bar.dart';
import 'package:todo_app/constants/basic_constants.dart';

import 'home_page/categories.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo - Manage Tasks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          const AppBarWidget(),
          Container(
            alignment:Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20,40,0,0),
              child: Text("What's Up, ${Constants.username}",style: TextStyle(
                fontWeight: FontWeight.bold,fontSize: 40 ,fontFamily: "mukta"
              )),
            ),
          ),
          Builder(
            builder: (context) {
              return Container(
                child: CategoriesWidget(),
              );
            }
          )
        ],

      )
    );
  }
}

