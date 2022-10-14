import 'package:flutter/material.dart';
import 'package:flutter_db/screens/home_screen.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'screens/form_screen.dart';
import 'providers/transaction_provider.dart';
import 'models/transactions.dart';
// flutter pub get
// flutter pub run flutter_launcher_icons:main

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return TransactionProvider();
        })
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const MyHomePage(title: 'ข้อมูลนิสิต'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 6, 194, 116),
        body: TabBarView(
          children: [HomeScreen(), FormScreen()],
        ),
        bottomNavigationBar: TabBar(
            tabs: [Tab(icon: Icon(Icons.list)), Tab(icon: Icon(Icons.add))]),
      ),
    );
  }
}
