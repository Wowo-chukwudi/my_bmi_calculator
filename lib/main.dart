import 'package:flutter/material.dart';
import 'package:my_bmi_calculator/model/bmi_provider.dart';
import 'package:my_bmi_calculator/screens/homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BmiProvider(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            primaryColor: const Color.fromARGB(255, 5, 148, 83),
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(backgroundColor: Colors.black)),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
