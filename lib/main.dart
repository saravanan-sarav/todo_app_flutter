import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_app/add_todo_page/add_todo.dart';
import 'package:todo_app/app_bar.dart';
import 'package:todo_app/drawer.dart';
import 'package:todo_app/home_page/today_tasks.dart';

import 'home_page/categories.dart';
import 'model/tasks.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale localeMain = const Locale('en'); // Default locale

  // List of supported locales
  List<Locale> supportedLocales = [
    const Locale('en'),
    const Locale('de'),
  ];

  // Function to handle locale change
  void changeLocale(Locale? locale) {
    setState(() {
      localeMain = locale!;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Todo - Manage Tasks',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: HomePage(
            locale: localeMain,
            changeLocale: changeLocale,
            supportedLocales: supportedLocales),
        supportedLocales: AppLocalizations.supportedLocales,
        locale: localeMain);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.locale,
    required this.changeLocale,
    required this.supportedLocales,
  });

  final Function(Locale) changeLocale;
  final Locale locale;
  final List<Locale> supportedLocales;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Task> tasksList;
  late Locale _locale;
  late List<Locale> _supportedLocales;
  late Function(Locale) changeLocale;

  @override
  void initState() {
    super.initState();
    tasksList = tasks;
    _locale = widget.locale;
    _supportedLocales = widget.supportedLocales;
    changeLocale = widget.changeLocale;
  }

  void _navigateToAddTodoPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTodo()),
    );
    tasks.add(result);
    setState(() {});
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
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
        key: _scaffoldKey,
        drawer: const DrawerWidget(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
              child: Container(
                alignment: Alignment.topRight,
                child: DropdownButton<Locale>(
                  value: _locale,
                  onChanged: (Locale? newLocale) {
                    changeLocale(newLocale!);
                  },
                  items: _supportedLocales.map((Locale locale) {
                    return DropdownMenuItem<Locale>(
                      value: locale,
                      child: Text(locale.languageCode),
                    );
                  }).toList(),
                ),
              ),
            ),
            AppBarWidget(
              openDrawer: openDrawer,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: Text(AppLocalizations.of(context)!.user_status("Sarav"),
                    style: const TextStyle(
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
