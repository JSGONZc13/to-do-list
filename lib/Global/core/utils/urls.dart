const String weatherApiHost = 'api.open-meteo.com';
const String weatherApiPath = '/v1/forecast';
final List<String> hourlyParams = ['temperature_2m', 'wind_speed_180m', 'rain'];
const String timeZone = 'auto';

const String locationMap = 'nominatim.openstreetmap.org';
const String locationPath = '/reverse';
const String userAgent = 'flutter-weather-app';