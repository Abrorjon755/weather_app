class Model {
  const Model({
    required this.hourlyCode,
    required this.hourlyTemp,
    required this.hourlyTime,
    required this.dailyCode,
    required this.dailyMin,
    required this.dailyMax,
    required this.dailyTime,
    required this.currentWindspeed,
    required this.currentTemp,
    required this.currentTime,
    required this.currentCode,
  });

  final String currentTime;
  final double currentTemp;
  final double currentWindspeed;
  final int currentCode;
  final List dailyTime;
  final List dailyMax;
  final List dailyMin;
  final List dailyCode;
  final List hourlyTime;
  final List hourlyTemp;
  final List hourlyCode;

  static Model fromJson(Map<String, Object?> json) {
    WeatherModel weatherModel = WeatherModel.fromJson(json);
    return Model(
      hourlyCode: weatherModel.hourly["weather_code"] as List,
      hourlyTemp: weatherModel.hourly["temperature_2m"] as List,
      hourlyTime: weatherModel.hourly["time"] as List,
      dailyCode: weatherModel.daily["weather_code"] as List,
      dailyMin: weatherModel.daily["temperature_2m_min"] as List,
      dailyMax: weatherModel.daily["temperature_2m_max"] as List,
      dailyTime: weatherModel.daily["time"] as List,
      currentWindspeed: weatherModel.currentWeather["windspeed"] as double,
      currentTemp: weatherModel.currentWeather["temperature"] as double,
      currentTime: weatherModel.currentWeather["time"] as String,
      currentCode: weatherModel.currentWeather["weathercode"] as int,
    );
  }
}

class WeatherModel {
  const WeatherModel({
    required this.currentWeather,
    required this.daily,
    required this.hourly,
  });

  final Map<String, Object?> currentWeather;
  final Map<String, Object?> daily;
  final Map<String, Object?> hourly;

  static WeatherModel fromJson(Map<String, Object?> json) {
    return WeatherModel(
      currentWeather: json["current_weather"] as Map<String, Object?>,
      daily: json["daily"] as Map<String, Object?>,
      hourly: json["hourly"] as Map<String, Object?>,
    );
  }
}
