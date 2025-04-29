import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Global/presentation/components/generals.dart';
import 'package:to_do_list_app/Global/presentation/provider/system_provider.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';
import 'package:to_do_list_app/Weather/domain/utils/value_objects/weather_codes.dart';
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
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final systemProvider = context.read<SystemProvider>();
      final weatherProvider = context.read<WeatherProvider>();

      systemProvider.getGeolocation(context).then((_) {
        final pos = systemProvider.position;
        if (pos != null) {
          weatherProvider.loadWeather(pos);
        }
      });
    });
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
    Future<void> _refreshWeather() async {
      final pos = systemProvider.position;
      if (pos != null) {
        await weatherProvider.loadWeather(pos);
      } else {
        await systemProvider.getGeolocation(context).then((_) async {
          final newPos = systemProvider.position;
          if (newPos != null) {
            await weatherProvider.loadWeather(newPos);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: cTransparent,
        body: CustomRefreshIndicator(
          onRefresh: _refreshWeather,
          child: isLoading
              ? Center(child: const CustomCircularProgressIndicator())
              : Flex(
                  spacing: medRadius,
                  direction: Axis.vertical,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [cPrimaryHover, cPrimary],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                            ),
                            borderRadius: BorderRadius.circular(smlRadius)),
                        child: Padding(
                          padding: const EdgeInsets.all(lrgRadius),
                          child: Flex(
                              spacing: medRadius,
                              direction: Axis.vertical,
                              children: [
                                Flex(
                                  direction: Axis.vertical,
                                  spacing: smlRadius,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('${weatherProvider.cityName}',
                                        style:
                                            pBaseFont.copyWith(color: cText)),
                                    Text(
                                        '${weatherProvider.weatherDailyData?.formattedDate}',
                                        style: pBaseFont.copyWith(color: cText))
                                  ],
                                ),
                                Flex(
                                  direction: Axis.vertical,
                                  spacing: medRadius,
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
                                    SizedBox(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.visible,
                                        maxLines: null,
                                        softWrap: true,
                                        '${weatherCodes.firstWhere((code) => code.code == weatherProvider.weatherDailyData!.weatherCode).description}',
                                        style: pResaltadoFont.copyWith(
                                            color: cText),
                                      ),
                                    )
                                  ],
                                ),
                                Flex(
                                  direction: Axis.horizontal,
                                  spacing: medRadius,
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
                                    const SizedBox(width: lrgRadius),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          'Max: ${weatherProvider.weatherDailyData!.maxTemperature} °C',
                                          style: pTitulosListasFont.copyWith(
                                              color: cText),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  child: Center(
                                    child: Text(
                                        'Rain: ${weatherProvider.weatherDailyData?.rainSum} mm',
                                        style: pImportantesFont.copyWith(
                                            color: cText)),
                                  ),
                                )
                              ]),
                        )),
                    Expanded(
                        child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Temperature(weatherProvider),
                        Rain(weatherProvider),
                        WindSpeed(weatherProvider)
                      ],
                    )),
                  ],
                ),
        ));
  }
}
