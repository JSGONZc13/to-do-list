import 'package:flutter/material.dart';

// RADIUS AND PADDING SIZES
const xxsRadius = 4.0;
const smlRadius = 8.0;
const medRadius = 16.0;
const lrgRadius = 32.0;

// SPECIFIC VALUES
final roundedShape =
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(smlRadius));
const paddingBtn =
    EdgeInsets.symmetric(horizontal: lrgRadius, vertical: medRadius);
const paddingBody = EdgeInsets.all(medRadius);
const paddingLogin = EdgeInsets.all(lrgRadius);
