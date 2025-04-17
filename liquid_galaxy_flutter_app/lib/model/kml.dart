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
<Document>
	<name>custom.kml</name>
	<Style id="purple_paddle">
		<BalloonStyle>
			<text>
         <text>
        <![CDATA[         
          <h2>My favorite trails!</h2>         
          <br/><br/>         
          The $[TrailHeadType/TrailHeadName/displayName] is <i>$[TrailHeadType/TrailHeadName]</i>.        
          The trail is $[TrailHeadType/TrailLength] miles.         <br/>        
          The climb is $[TrailHeadType/ElevationGain] meters.         <br/><br/>       
        ]]>
      
      </text>
      <bgColor>fffffff</bgColor>
		</BalloonStyle>
	</Style>
	<Placemark id="0A7ACC68BF23CB81B354">
		<name>custom</name>
		<Snippet maxLines="0"></Snippet>
		<description><![CDATA[
]]></description>
		<LookAt>
			<longitude>-17.841486</longitude>
			<latitude>28.638478</latitude>
			<altitude>0</altitude>
			<heading>0</heading>
			<tilt>0</tilt>
			<range>24000</range>
		</LookAt>
		<styleUrl>#purple_paddle</styleUrl>
		<gx:balloonVisibility>1</gx:balloonVisibility>
		<Point>
			<coordinates>-17.841486,28.638478,0</coordinates>
		</Point>
	</Placemark>
</Document>
</kml>
''';
  }
}



    // <li>${facts[0]}</li>
    //     <li>${facts[1]}</li>
    //     <li>${facts[2]}</li>
