import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:prepathon/services/searchAI.dart';

class loading extends StatefulWidget {
  String? data;
  loading({this.data});
  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {
  searchAI input = searchAI();

  void getResponse() async {
    GenerateContentResponse response = await input.search(widget.data!);
    print("response dapat to tngina $response");
    if (response != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => Response(response: response)));
    }
  }

  @override
  void initState() {
    getResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitDoubleBounce(
        size: 100,
        color: Colors.red,
      ),
    );
  }
}

class Response extends StatefulWidget {
  var response;
  Response({this.response});
  @override
  State<Response> createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Container(
            child: Text("${widget.response.text}"),
          ),
        ),
      ),
    );
  }
}
