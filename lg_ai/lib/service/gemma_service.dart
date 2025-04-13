import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class GemmaService {
  String prompt = '''

        You are an advanced AI model with extensive knowledge of various travel destinations and touristic information. 
        Use your internal knowledge and the provided context to generate a comprehensive and accurate response.
        Your answer must include  a brief description of specific place, and what makes it unique.
        Your answer must include the country.
        If any of the information is not available to you, leave empty.
        Do not include null in your response. 
        Do not omit any place from the list for brevity. 
        Your answer must be in a Well-defined JSON format, with correct curly braces, commas, and quotes. Only user double quotes for strings in your JSON format.
        If a string is empty, do not write null, just leave it as an empty string.
        The response should be in UTF-8 JSON format, all places enclosed in the 'places' field of the JSON to be returned without any extra comments or quote wrappers.
        The response should not be enclosed in a code section.

        
''';

  String prompTemplate = '''
I want information about the place: [PLACE_NAME]. Please provide a brief description of this place and at least three interesting facts about it. Structure your response as a JSON object with the following keys: "place" (containing the name of the place), "description", and "interesting_facts" (containing a list of at least three strings, each being an interesting fact).

For example, if the place is "Eiffel Tower", the JSON response should look like this:

```json
{
  "place": "Eiffel Tower",
  "description": "The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France. It is named after the engineer Gustave Eiffel, whose company designed and built the tower.",
  "interesting_facts": [
    "The Eiffel Tower was originally intended to be a temporary structure built for the 1889 World's Fair.",
    "It sways in the wind, sometimes by several inches.",
    "The tower has different heights depending on the temperature due to thermal expansion."
  ]
}```
''';
  Future<void> connectWithGemma() async {
    String url = dotenv.get('VERTEX_AI');
    final link = Uri.https(url, '/endpoint');
    final request = await http.post(link);

    log(request.body);
    log(request.body);
  }
}

class GemmaData {
  // String description;
}
