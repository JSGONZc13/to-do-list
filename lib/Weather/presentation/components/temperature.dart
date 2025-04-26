import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/components/cards.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';
import 'package:to_do_list_app/Weather/presentation/provider/weather_provider.dart';

CustomCard Temperature(WeatherProvider weatherProvider) {
  return CustomCard(
      color: cWhiteHover,
      child: Table(
        children: [
          TableRow(children: [
            SizedBox(
                child: Center(
                    child: Text('Temperatura (°C)', style: pImportantesFont)))
          ]),
          TableRow(children: [const SizedBox(height: medRadius)]),
          TableRow(
            children: [
              SizedBox(
                child: DataTable(
                  horizontalMargin: 0,
                  columnSpacing: 0,
                  columns: weatherProvider.weatherData!
                      .map((day) => DataColumn(
                          headingRowAlignment: MainAxisAlignment.center,
                          label: Text(
                            day.formattedDay,
                            style: pTabsBtnsFont,
                          )))
                      .toList(),
                  rows: <DataRow>[
                    DataRow(
                      cells: weatherProvider.weatherData!
                          .map((day) => DataCell(
                                SizedBox(
                                  child: Center(
                                    child: Text(
                                      '${day.maxTemperature}',
                                      style: pMiniFont,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    DataRow(
                      cells: weatherProvider.weatherData!
                          .map((day) => DataCell(
                                SizedBox(
                                  child: Center(
                                    child: Text(
                                      '${day.minTemperature}',
                                      style: pMiniFont,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ));
}
