import 'package:flutter/material.dart';

class WeatherCode {
  final int code;
  final String description;
  final IconData icon;

  const WeatherCode({
    required this.code,
    required this.description,
    required this.icon,
  });
}