class SendKML {
  static String sendClean(String id) {
    return '''
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">
<Document id="$id">
 </Document>
</kml>
    ''';
  }

  static String sendOverlay() {
    return '';
  }
}
