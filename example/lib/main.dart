import 'package:flutter/material.dart';
import 'package:kiyibodi/kiyibodi.dart';

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
            Center(
              child: ValueListenableBuilder<KiyibodiEditingValue>(
                valueListenable: keyboardController,
                builder: (context, value, _) {
                  return Text(
                    value.text,
                    style: TextStyle(
                      fontSize: 42,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 300,
        child: Kiyibodi(
          maxLength: 4,
          onDone: (value) {
            print('Keyboard $value');
          },
          keyboardController: keyboardController,
        ),
      ),
    );
  }
}
