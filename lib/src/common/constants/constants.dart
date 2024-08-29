class Constants {
  const Constants._();

  static const String baseUrl = "https://api.open-meteo.com/v1/forecast";
  static const String tashkent =
      "?latitude=41.29&longitude=69.24&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String kokand =
      "?latitude=40.53&longitude=70.93&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String altyaryk =
      "?latitude=40.40&longitude=71.48&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String andijan =
      "?latitude=40.81&longitude=72.28&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String bukhara =
      "?latitude=39.76&longitude=64.45&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String fergana =
      "?latitude=40.37&longitude=71.79&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String jizzakh =
      "?latitude=40.12&longitude=67.88&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String namangan =
      "?latitude=41.00&longitude=71.64&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String navoiy =
      "?latitude=40.09&longitude=65.35&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String qarshi =
      "?latitude=38.86&longitude=65.78&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String samarqand =
      "?latitude=39.65&longitude=66.96&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String guliston =
      "?latitude=40.49&longitude=68.78&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String termez =
      "?latitude=37.26&longitude=67.30&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String urgench =
      "?latitude=41.53&longitude=60.62&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";
  static const String nukus =
      "?latitude=42.46&longitude=59.61&current_weather=true&hourly=temperature_2m,weather_code&daily=temperature_2m_max,temperature_2m_min,weather_code";

  static const String kokandName = "Kokand";
  static const String tashkentName = "Tashkent";
  static const String altyarykName = "Altyaryk";
  static const String andijanName = "Andijan";
  static const String bukharaName = "Bukhara";
  static const String ferganaName = "Fergana";
  static const String jizzakhName = "Jizzakh";
  static const String namanganName = "Namangan";
  static const String navoiyName = "Navoiy";
  static const String qarshiName = "Qarshi";
  static const String samarqandName = "Samarqand";
  static const String gulistonName = "Guliston";
  static const String termezName = "Termez";
  static const String urgenchName = "Urgench";
  static const String nukusName = "Nukus";
  static const Map<String, String> names = {
    kokandName: kokand,
    tashkentName: tashkent,
    altyarykName: altyaryk,
    andijanName: andijan,
    bukharaName: bukhara,
    ferganaName: fergana,
    jizzakhName: jizzakh,
    namanganName: namangan,
    navoiyName: navoiy,
    qarshiName: qarshi,
    samarqandName: samarqand,
    gulistonName: guliston,
    termezName: termez,
    urgenchName: urgench,
    nukusName: nukus,
  };
}
