import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFF6D4D),
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text('Home'),
          // leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('assets/ke_logo.jpeg', width: 40),
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: double.infinity,
                  height: 100,
                  child: Container(
                    width: 200,
                    height: 100, // Set the width of the Text widget here
                    child: Center(
                      child: Text(
                        'Welcome, User!',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Text(
                  'Hello World!',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Image.asset(
                  'assets/ke_logo.jpeg',
                  width: 180,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}
