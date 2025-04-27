import 'package:to_do_list_app/Weather/domain/entities/weather_code.dart';
import 'package:weather_icons/weather_icons.dart';

final List<WeatherCode> weatherCodes = [
  WeatherCode(
    code: 0,
    description: 'Clear sky',
    icon: WeatherIcons.day_sunny,
  ),
  WeatherCode(
    code: 1,
    description: 'Mainly clear',
    icon: WeatherIcons.day_sunny_overcast,
  ),
  WeatherCode(
    code: 2,
    description: 'Partly cloudy',
    icon: WeatherIcons.day_cloudy,
  ),
  WeatherCode(
    code: 3,
    description: 'Overcast',
    icon: WeatherIcons.cloudy,
  ),
  WeatherCode(
    code: 45,
    description: 'Fog',
    icon: WeatherIcons.fog,
  ),
  WeatherCode(
    code: 48,
    description: 'Depositing rime fog',
    icon: WeatherIcons.fog,
  ),
  WeatherCode(
    code: 51,
    description: 'Light drizzle',
    icon: WeatherIcons.sprinkle,
  ),
  WeatherCode(
    code: 53,
    description: 'Moderate drizzle',
    icon: WeatherIcons.showers,
  ),
  WeatherCode(
    code: 55,
    description: 'Dense drizzle',
    icon: WeatherIcons.rain,
  ),
  WeatherCode(
    code: 56,
    description: 'Light freezing drizzle',
    icon: WeatherIcons.sleet,
  ),
  WeatherCode(
    code: 57,
    description: 'Dense freezing drizzle',
    icon: WeatherIcons.sleet,
  ),
  WeatherCode(
    code: 61,
    description: 'Slight rain',
    icon: WeatherIcons.showers,
  ),
  WeatherCode(
    code: 63,
    description: 'Moderate rain',
    icon: WeatherIcons.rain,
  ),
  WeatherCode(
    code: 65,
    description: 'Heavy rain',
    icon: WeatherIcons.rain_wind,
  ),
  WeatherCode(
    code: 66,
    description: 'Light freezing rain',
    icon: WeatherIcons.sleet,
  ),
  WeatherCode(
    code: 67,
    description: 'Heavy freezing rain',
    icon: WeatherIcons.sleet,
  ),
  WeatherCode(
    code: 71,
    description: 'Slight snowfall',
    icon: WeatherIcons.snow,
  ),
  WeatherCode(
    code: 73,
    description: 'Moderate snowfall',
    icon: WeatherIcons.snow,
  ),
  WeatherCode(
    code: 75,
    description: 'Heavy snowfall',
    icon: WeatherIcons.snow_wind,
  ),
  WeatherCode(
    code: 77,
    description: 'Snow grains',
    icon: WeatherIcons.snowflake_cold,
  ),
  WeatherCode(
    code: 80,
    description: 'Slight rain showers',
    icon: WeatherIcons.showers,
  ),
  WeatherCode(
    code: 81,
    description: 'Moderate rain showers',
    icon: WeatherIcons.showers,
  ),
  WeatherCode(
    code: 82,
    description: 'Violent rain showers',
    icon: WeatherIcons.rain_wind,
  ),
  WeatherCode(
    code: 85,
    description: 'Slight snow showers',
    icon: WeatherIcons.snow,
  ),
  WeatherCode(
    code: 86,
    description: 'Heavy snow showers',
    icon: WeatherIcons.snow_wind,
  ),
  WeatherCode(
    code: 95,
    description: 'Thunderstorm',
    icon: WeatherIcons.thunderstorm,
  ),
  WeatherCode(
    code: 96,
    description: 'Thunderstorm with slight hail',
    icon: WeatherIcons.thunderstorm,
  ),
  WeatherCode(
    code: 99,
    description: 'Thunderstorm with heavy hail',
    icon: WeatherIcons.thunderstorm,
  ),
];
