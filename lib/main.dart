import 'package:flutter/material.dart';
import 'package:todo_app/add_todo_page/add_todo.dart';
import 'package:todo_app/app_bar.dart';
import 'package:todo_app/home_page/today_tasks.dart';

import 'constants/basic_constants.dart';
import 'home_page/categories.dart';
import 'model/tasks.dart';

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

class _HomePageState extends State<HomePage> {
  late List<Task> tasksList;

  @override
  void initState() {
    super.initState();
    tasksList = tasks;
  }

  void _navigateToAddTodoPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTodo()),
    );
    tasks.add(result);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _navigateToAddTodoPage(context);
            // Navigator.push(
            //   context,
            //   PageRouteBuilder(
            //     pageBuilder: (context, animation, secondaryAnimation) =>
            //         const AddTodo(),
            //     transitionsBuilder:
            //         (context, animation, secondaryAnimation, child) {
            //       return FadeTransition(opacity: animation, child: child);
            //     },
            //   ),
            // );
          },
          shape: const StadiumBorder(),
          backgroundColor: Colors.blue,
          child: const Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(),
            Container(
              alignment: Alignment.topLeft,
              child: const Padding(
                padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: Text("What's Up, ${Constants.username}!",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        fontFamily: "mukta")),
              ),
            ),
            const CategoriesWidget(),
            Expanded(
                child: TodayTaskWidget(
              tasksList: tasksList,
            )),
          ],
        ));
  }
}
