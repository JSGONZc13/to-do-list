import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Weather/presentation/provider/weather_provider.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => WeatherProvider()..getGeolocation(context),
        child: Consumer<WeatherProvider>(builder: (context, provider, _) {
          return Scaffold(
            body: Center(
                child: provider.position == null
                    ? const CircularProgressIndicator()
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('LAT: ${provider.position?.latitude ?? ""}'),
                          Text('LNG: ${provider.position?.longitude ?? ""}'),
                        ],
                      )),
          );
        }));
  }
}
