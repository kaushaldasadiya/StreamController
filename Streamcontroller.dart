import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  StreamController<int> countercontroller = StreamController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text(
          "StreamController",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
            stream: countercontroller.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                );
              } else {
                return Text(
                  "0",
                  style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter++;
          countercontroller.sink.add(counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
