import 'package:lg_ai/model/ai_data_model.dart';

class KML {
  final String name;
  final String id;
  final String heading;
  final String description;
  final List<String> facts;
  final Location location;

  KML({
    required this.name,

    required this.id,
    required this.heading,
    required this.description,
    required this.facts,
    required this.location,
  });

  String get fileKML {
    // final listOffacts = facts.map((fact) => ' <li>$fact <li>').join('\n');
    return '''
<?xml version="1.0" encoding="UTF-8"?>
  <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document id="$id">
 
          <name>Network Links</name>
          <visibility>1</visibility>
          <description>Example</description>
      <name>$name</name>
        <Placemark>
  <name>Valley of Flowers National Park</name>
  <description>
    <![CDATA[
      <h2 style="color:#2E8B57;">$heading</h2>
      <p>
      </p>
      <ul>
     ${facts.map((fact) => ' <li>$fact<li>').join('\n')}    
      </ul>
    ]]>
  </description>
  <Point>
    <coordinates> ${location.longitute},${location.latitude}</coordinates>
  </Point>
</Placemark>'
        
    </Document>
  </kml>
''';
  }
}



    // <li>${facts[0]}</li>
    //     <li>${facts[1]}</li>
    //     <li>${facts[2]}</li>
