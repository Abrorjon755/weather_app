class Weather {
  const Weather._();

  static String name(int i) => switch (i) {
        0 => "Clear",
        1 => "Mainly Clear",
        2 => "Partly Cloud",
        3 => "Overcast",
        45 => "Fog",
        48 => "Rime Fog",
        51 || 53 || 55 => "Drizzle",
        56 || 57 => "Freezing Drizzle",
        61 || 63 || 65 => "Rain",
        66 || 67 => "Freezing Rain",
        71 || 73 || 75 => "Snow Fall",
        77 => "Snow Grains",
        80 || 81 || 82 => "Rain Showers",
        85 || 86 => "Snow Showers",
        95 || 96 || 99 => "Thunderstorm",
        _ => "Clear",
      };
}
