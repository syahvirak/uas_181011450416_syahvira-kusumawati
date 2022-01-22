class Weather {
  final String name;
  final String icon;
  final String description;
  final double temp;
  final double wind;
  final double long;
  final double lat;

  Weather({
    this.name = '',
    this.icon = '',
    this.description = '',
    this.temp = 0,
    this.wind = 0,
    this.long = 0,
    this.lat = 0,
  });
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
       name: json['name'] ?? '',
      description: json['weather'][0]['description'] ?? '',
      icon: json['weather'][0]['icon'] ?? '',
      temp: json['main']['temp'] ?? '',
      wind: json['wind']['speed'] ?? '',
      long: json['coord']['lon'] ?? '',
      lat: json['coord']['lat'] ?? '',
    );
  }
}