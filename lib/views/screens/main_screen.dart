import 'package:flutter/material.dart';
import 'package:simple_app/utils/components/custom_navbar.dart';
import 'package:simple_app/views/screens/form_page.dart';
import 'package:simple_app/views/screens/home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  List<Widget> screens = [Home(), FormPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: CustomNavbar(
        onTap: (value) {
          setState(() {
            //buat perubahan screen (digunakan dlm stateful widget sahaja)
            currentIndex = value;
          });
        },
      ),
    );
  }
}
