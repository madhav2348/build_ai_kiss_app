class AIDataModel {
  final String place;
  final String description;
  final List<String> intrestingFact;
  final Location latlog;

  AIDataModel({
    required this.place,
    required this.description,
    required this.intrestingFact,
    required this.latlog,
  });

  factory AIDataModel.fromJson(Map<String, dynamic> data) {
    return AIDataModel(
      place: data['place'],
      description: data['description'],
      intrestingFact: data['intresting_facts'],
      latlog: Location.fromJson(data['coordiantes']),
    );
  }
}

class Location {
  final String latitude;
  final String longitute;

  Location({required this.latitude, required this.longitute});

  factory Location.fromJson(Map<String, dynamic> data) {
    return Location(latitude: data["latitude"], longitute: data["longitute"]);
  }
}
