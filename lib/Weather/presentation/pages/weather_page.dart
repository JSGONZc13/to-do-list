import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Global/presentation/components/custom_tabbar.dart';
import 'package:to_do_list_app/Global/presentation/components/generals.dart';
import 'package:to_do_list_app/Global/presentation/provider/system_provider.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';
import 'package:to_do_list_app/Weather/presentation/provider/weather_provider.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  bool _hasLoaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Solo ejecuta la lógica una vez para evitar múltiples llamados
    if (!_hasLoaded) {
      final systemProvider = context.read<SystemProvider>();
      final weatherProvider = context.read<WeatherProvider>();

      systemProvider.getGeolocation(context).then((_) {
        final pos = systemProvider.position;
        if (pos != null) {
          weatherProvider.loadWeather(pos);
        }
      });

      _hasLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final systemProvider = context.watch<SystemProvider>();
    final weatherProvider = context.watch<WeatherProvider>();

    final isLoading = systemProvider.position == null ||
        weatherProvider.weatherData == null ||
        weatherProvider.cityName == null;

    return Scaffold(
      backgroundColor: cWhite,
      body: Center(
        child: isLoading
            ? const CustomCircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('City: ${weatherProvider.cityName}',
                      style: pResaltadoFont),
                  const SizedBox(height: lrgRadius),
                  Expanded(
                    child: DefaultTabController(
                      length: weatherProvider.weatherData!.length,
                      child: Padding(
                        padding: const EdgeInsets.all(smlRadius),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(xxsRadius),
                              decoration: tabDecoration,
                              child: CustomStyledTabBar(
                                tabs: weatherProvider.weatherData!.entries
                                    .map((entry) => CustomTab(
                                          child: Text(entry.key),
                                        ))
                                    .toList(),
                              ),
                            ),
                            const SizedBox(height: medRadius),
                            Expanded(
                              child: TabBarView(
                                children: weatherProvider.weatherData!.entries
                                    .map((entry) {
                                  final forecasts = entry.value;
                                  return SingleChildScrollView(
                                    child: Table(
                                      border: TableBorder.all(),
                                      children: [
                                        const TableRow(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFE0E0E0),
                                          ),
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text('Hora'),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text('Temp.'),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text('Viento'),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Text('Lluvia'),
                                            ),
                                          ],
                                        ),
                                        ...forecasts.map(
                                          (forecast) => TableRow(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                    forecast.formattedHour),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                    '${forecast.temperature}°C'),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child: Text(
                                                    '${forecast.windSpeed} km/h'),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8),
                                                child:
                                                    Text('${forecast.rain} mm'),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
