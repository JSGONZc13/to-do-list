import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

final textFieldDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(smlRadius),
    borderSide: const BorderSide(color: cBlack, width: 1.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(smlRadius),
    borderSide: const BorderSide(color: cPrimary, width: 1.0),
  ),
  hintText: 'Enter text',
  hintStyle: quoteFont,
  contentPadding:
      const EdgeInsets.symmetric(horizontal: medRadius, vertical: smlRadius),
);
