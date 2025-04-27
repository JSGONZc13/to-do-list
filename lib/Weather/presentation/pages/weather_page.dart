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
    final cText = cWhite;
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
                      surfaceTintColor: cTransparent,
                      pinned: true,
                      expandedHeight: 250.0,
                      centerTitle: true,
                      title: Center(
                        child: Text('${weatherProvider.cityName}',
                            style: pBaseFont.copyWith(color: cText)),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(
                                  '${weatherProvider.weatherDailyData?.formattedDate}',
                                  style: pBaseFont.copyWith(color: cText)),
                            ),
                            if (weatherProvider.weatherDailyData != null)
                              Padding(
                                padding: const EdgeInsets.all(medRadius),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      weatherCodes
                                          .firstWhere((code) =>
                                              code.code ==
                                              weatherProvider.weatherDailyData!
                                                  .weatherCode)
                                          .icon,
                                      size: 28,
                                      color: cText,
                                    ),
                                    const SizedBox(width: medRadius),
                                    Text(
                                      weatherCodes
                                          .firstWhere((code) =>
                                              code.code ==
                                              weatherProvider.weatherDailyData!
                                                  .weatherCode)
                                          .description,
                                      style:
                                          pResaltadoFont.copyWith(color: cText),
                                    )
                                  ],
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(medRadius),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Min: ${weatherProvider.weatherDailyData!.minTemperature} °C',
                                        style: pTitulosListasFont.copyWith(
                                            color: cText),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        'Max: ${weatherProvider.weatherDailyData!.maxTemperature} °C',
                                        style: pTitulosListasFont.copyWith(
                                            color: cText),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Text(
                                'Rain: ${weatherProvider.weatherDailyData?.rainSum} mm',
                                style: pImportantesFont.copyWith(color: cText)),
                          ],
                        ),
                      ),
                    ),
                    SliverList(
                        delegate: SliverChildListDelegate([
                      SizedBox(height: medRadius),
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
