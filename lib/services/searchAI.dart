import 'package:google_generative_ai/google_generative_ai.dart';

String apiKey =
    "magsearch ka boi ng apiKEY mo"; //https://ai.google.dev/ kuha ka dto

class searchAI {
  final model =
      GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);

  Future<GenerateContentResponse> search(String input) async {
    final content = [Content.text(input)];
    final response = await model.generateContent(content);

    return response;
  }
}
