import 'package:app_shared_preferences/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp( MainApp(prefs: prefs));
}

class MainApp extends StatelessWidget {
  final SharedPreferences prefs;
  const MainApp({super.key, required this.prefs});

  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      home: MyHomePage(prefs: prefs),
    );  
  }
}
