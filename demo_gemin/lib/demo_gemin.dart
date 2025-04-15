import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future calculate() async {
  String promptTemplate =
      '''I want information about the place: London. Please provide a brief description of this place and at least three interesting facts about it and coordinates. Structure your response as a JSON object with the following keys: "place" (containing the name of the place), "description", and "interesting_facts" (containing a list of at least three strings, each being an interesting fact).

For example, if the place is "Eiffel Tower", the JSON response should look like this:

{
  "place": "Eiffel Tower",
  "latitude":"",
  "longitude":""
  "description": "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.",
  "interesting_facts": [
    "The Eiffel Tower was originally intended to be a temporary structure built for the 1889 World's Fair.",
    "It sways in the wind, sometimes by several inches.",
    "The tower has different heights depending on the temperature due to thermal expansion."
  ]
}
''';
  // final GEMINI_API_KEY = ;
  dotenv.load(fileName: 'GEMINI_API_KEY');
  final GEMINI_API_KEY = dotenv.env['GEMINI_API_KEY'];
  final String apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$GEMINI_API_KEY';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": promptTemplate},
            ],
          },
        ],
        "generationConfig": {"response_mime_type": "application/json"},
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final String? geminiResponse =
          responseData['candidates']?[0]?['content']?['parts']?[0]?['text'];
      // final String jsonResponse = jsonDecode(geminiResponse!);

      print(geminiResponse);
    } else {
      print('Error: ${response.statusCode}');
      print('Error Body: ${response.body}');
    }
  } catch (error) {
    print('An error occurred: $error');
  }
}
