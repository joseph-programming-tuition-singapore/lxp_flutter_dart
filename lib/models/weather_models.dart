class WeatherResult {
  final String lat;
  final String lng;

  WeatherResult(this.lat, this.lng);

  WeatherResult.fromJson(Map<String, dynamic> json)
      : lat = json['latitude'].toString(),
        lng = json['longitude'].toString();

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'longitude': lng,
      };
}
