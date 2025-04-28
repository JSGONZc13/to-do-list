const String weatherApiPath = '/v1/forecast';
const String timeZone = 'auto';
final List<String> hourlyParams = [
  'temperature_2m',
  'wind_speed_180m',
  'rain',
];
final List<String> dailyParams = [
  'weather_code',
  'temperature_2m_max',
  'temperature_2m_min',
  'rain_sum',
];