import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage  extends StatefulWidget {
  final SharedPreferences prefs;
  const MyHomePage ({super.key, required this.prefs});

  @override
  State<MyHomePage > createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage > {
   late String _username;

   @override
  void initState() {
   
    super.initState();
    _username = widget.prefs.getString('username') ?? '';
  }

  void _saveUsername(String username) {
    setState(() {
       _username = username;
    });
    widget.prefs.setString('username', username);
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(

      appBar: AppBar(title:const Text('SharedPreferences Example')),
      body: Column(
        children: [
          TextField(
            onChanged: _saveUsername,
            decoration: const InputDecoration(
              labelText: 'Enter Username',
            ),
          ),
          Text('Saved Username: $_username'),
        ],
      ),
    );
  }  
}