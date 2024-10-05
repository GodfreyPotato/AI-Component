import 'package:google_generative_ai/google_generative_ai.dart';
String apiKey = "AIzaSyD1cdtxA5XLnt5F-LKxYPYZzOVAqUpaBhg";

class searchAI{

  final model = GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);

  Future<GenerateContentResponse> search(String input) async{

    final content = [Content.text(input)];
    final response = await model.generateContent(content);

    return response;
  }

}