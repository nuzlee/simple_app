import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_app/utils/state_management/userdata_provider.dart';
// import 'package:simple_app/views/screens/home.dart';
import 'package:simple_app/views/screens/main_screen.dart';

void main() {
  // runApp(const MainApp());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<UserDataProvider>(
          create: (_) => UserDataProvider(),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen());
  }
}
