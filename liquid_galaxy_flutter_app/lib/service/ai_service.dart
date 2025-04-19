import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:lg_ai/model/ai_data_model.dart';
import 'package:lg_ai/showtoast.dart';

class GeminiService extends ChangeNotifier {
  AIDataModel? _model;
  // =  AIDataModel(
  //   place: '',
  //   description: '',
  //   intrestingFact: [],
  //   latlog: Location(latitude: '', longitute: ''),
  // );
  AIDataModel get model => _model!;

  static String prompTemplate(String place) => '''
I want information about the place: $place. Please provide a brief description of this place and at least three interesting facts about it and coordinates. Structure your response as a JSON object with the following keys: "place" (containing the name of the place), "description",  "interesting_facts" (containing a list of at least three strings, each being an interesting fact) and "coordinates"(containing "latitide" as latitude and "longitide" as longitude).


''';

  Future<void> connectWithGemini(String place) async {
    try {
      String GEMINI_AI = dotenv.get('GEMINI_AI');
      final url =
          'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$GEMINI_AI';
      final link = Uri.parse(url);
      final request = await http.post(
        link,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          "contents": [
            {
              "parts": [
                {"text": prompTemplate(place)},
              ],
            },
          ],
          "generationConfig": {"response_mime_type": "application/json"},
        }),
      );

      if (request.statusCode == 200) {
        final jsonData = jsonDecode(request.body);
        Map<String, dynamic> rawJson = jsonDecode(
          jsonData['candidates'][0]['content']['parts'][0]['text'],
        );

        _model = AIDataModel.fromJson(rawJson);
        notifyListeners();
      } else {}
    } catch (e) {
      print(e);
      showToast('Error during  Fetching AI data');
    }
  }
}

// class GemmaData {
// String description;
// }

// class GemmaService {

// class GemmaData {
//   // String description;
// }
