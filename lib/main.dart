import 'package:flutter/material.dart';
import 'package:prepathon/screen/response.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Prepathon(),
    );
  }
}

class Prepathon extends StatefulWidget {
  const Prepathon({super.key});

  @override
  State<Prepathon> createState() => _PrepathonState();
}

class _PrepathonState extends State<Prepathon> {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: search,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Enter text to search",
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => loading(data: search.text)));
                },
                child: Text("Search"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
