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

class CustomInputField extends StatelessWidget {
  final String? variant;
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  const CustomInputField({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.variant = 'default',
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration:
          variant == 'default' ? textFieldDecoration : null,
      style: pFont,
    );
  }
}
