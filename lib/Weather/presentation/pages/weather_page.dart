import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Global/presentation/components/containers.dart';
import 'package:to_do_list_app/Global/presentation/components/custom_tabbar.dart';
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
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WeatherProvider()..getGeolocation(context),
      child: Consumer<WeatherProvider>(
        builder: (context, provider, _) {
          final isLoading = provider.position == null ||
              provider.weatherData == null ||
              provider.cityName == null;

          return Scaffold(
            backgroundColor: cWhite,
            body: Center(
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('City: ${provider.cityName}', style: h3Font),
                        const SizedBox(height: lrgRadius),
                        Expanded(
                          child: DefaultTabController(
                            length: provider.weatherData!.length,
                            child: Padding(
                              padding: const EdgeInsets.all(smlRadius),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(xxsRadius),
                                    decoration: tabDecoration,
                                    child: CustomStyledTabBar(
                                      tabs: provider.weatherData!.entries
                                          .map((entry) =>
                                              CustomTab(child: Text(entry.key)))
                                          .toList(),
                                    ),
                                  ),
                                  const SizedBox(height: medRadius),
                                  Expanded(
                                    child: TabBarView(
                                      children: provider.weatherData!.entries
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
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Text(forecast
                                                          .formattedHour),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Text(
                                                          '${forecast.temperature}°C'),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Text(
                                                          '${forecast.windSpeed} km/h'),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8),
                                                      child: Text(
                                                          '${forecast.rain} mm'),
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
        },
      ),
    );
  }
}
