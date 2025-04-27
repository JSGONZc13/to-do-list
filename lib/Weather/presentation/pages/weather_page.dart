import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Global/presentation/components/generals.dart';
import 'package:to_do_list_app/Global/presentation/provider/system_provider.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';
import 'package:to_do_list_app/Weather/core/utils/weather_codes.dart';
import 'package:to_do_list_app/Weather/presentation/components/rain.dart';
import 'package:to_do_list_app/Weather/presentation/components/temperature.dart';
import 'package:to_do_list_app/Weather/presentation/components/wind_speed.dart';
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
        weatherProvider.cityName == null ||
        weatherProvider.weatherDailyData == null;

    return Scaffold(
      backgroundColor: cWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(smlRadius),
          child: isLoading
              ? const CustomCircularProgressIndicator()
              : CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      shape: roundedShape,
                      backgroundColor: cPrimary,
                      pinned: true,
                      expandedHeight: 250.0,
                      flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Center(
                          child: Text('Ciudad: ${weatherProvider.cityName}',
                              style:
                                  pTituloPrincipalFont.copyWith(color: cWhite)),
                        ),
                        background: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (weatherProvider.weatherDailyData != null)
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    weatherCodes
                                        .firstWhere((code) =>
                                            code.code ==
                                            weatherProvider
                                                .weatherDailyData!.weatherCode)
                                        .icon,
                                    size: 24,
                                    color: cWhite,
                                  ),
                                  const SizedBox(width: medRadius),
                                  Text(
                                    weatherCodes
                                        .firstWhere((code) =>
                                            code.code ==
                                            weatherProvider
                                                .weatherDailyData!.weatherCode)
                                        .description,
                                    style: pTituloPrincipalFont.copyWith(
                                        color: cWhite),
                                  )
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      SizedBox(height: smlRadius),
                      Temperature(weatherProvider),
                      Rain(weatherProvider),
                      WindSpeed(weatherProvider)
                    ]))
                  ],
                ),
        ),
      ),
    );
  }
}
