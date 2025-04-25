import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

const buttonStyle = ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(cPrimary),
  padding: MaterialStatePropertyAll(EdgeInsets.all(medRadius)),
);
final buttonListStyle = ButtonStyle(
  backgroundColor: const MaterialStatePropertyAll(cTransparent),
  padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(smlRadius), // rounded corners
  )),
);

class CustomIconButton extends StatelessWidget {
  final String variant;
  final void Function()? onPressed;
  final Widget icon;
  final Color? color;
  const CustomIconButton({
    super.key,
    required this.variant,
    this.onPressed,
    required this.icon,
    this.color,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      color: color,
      icon: icon,
      style: variant == 'action' ? buttonStyle : buttonListStyle,
      onPressed: onPressed,
    );
  }
}
