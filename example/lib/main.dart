import 'package:flutter/material.dart';
import 'package:kiyibodi/keyboard.dart';
import 'package:kiyibodi/keyboard_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiyibodi Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final keyboardController = KeyboardController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 4,
              child: Center(
                child: ValueListenableBuilder<String>(
                  valueListenable: keyboardController,
                  builder: (context, text, _) {
                    return Text(
                      text,
                      style: TextStyle(
                        fontSize: 42,
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Kiyibodi(
                keyboardController: keyboardController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
