class KML {
  String name;
  String content;
  String id;

  KML(this.name, {required this.content, required this.id});

  String get fileKML {
    return '''
<?xml version="1.0" encoding="UTF-8"?>
  <kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
    <Document id="$id">
 
          <name>Network Links</name>
          <visibility>1</visibility>
          <description>Example</description>
      <name>$name</name>
        $content
    </Document>
  </kml>
''';
  }
}
