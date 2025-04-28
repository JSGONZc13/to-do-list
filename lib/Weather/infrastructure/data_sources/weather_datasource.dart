import 'package:to_do_list_app/Global/domain/utils/connections/urls.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:to_do_list_app/Weather/domain/utils/connections/nominatim.dart';
import 'package:to_do_list_app/Weather/domain/utils/connections/open_meteo.dart';

class WeatherDatasource {
  Future<dynamic> getWeather(String lat, String lng) async {
    final url = Uri.https(weatherApiHost, weatherApiPath, {
      'latitude': lat,
      'longitude': lng,
      'hourly': hourlyParams.join(','),
      'timezone': timeZone,
    });

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<dynamic> getWeatherDaily(String lat, String lng) async {
    final url = Uri.https(weatherApiHost, weatherApiPath, {
      'latitude': lat,
      'longitude': lng,
      'daily': dailyParams.join(','),
      'timezone': timeZone,
      'forecast_days': "1",
    });

    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load weather day data');
    }
  }

  Future<dynamic> getCityName(String lat, String lng) async {
    final url = Uri.https(locationMap, locationPath, {
      'lat': lat,
      'lon': lng,
      'format': 'json',
    });

    try {
      final response = await http.get(url, headers: {'User-Agent': userAgent});
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['address']?['city'] ??
            data['address']?['town'] ??
            data['address']?['village'] ??
            data['address']?['state']; // fallback
      }
    } catch (e) {
      throw Exception('Failed to load city name: $e');
    }

    return null;
  }
}
