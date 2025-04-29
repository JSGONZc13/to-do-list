import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

final buttonStyle = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(cPrimary),
  padding: WidgetStatePropertyAll(EdgeInsets.all(medRadius)),
);
final buttonListStyle = ButtonStyle(
  backgroundColor: const WidgetStatePropertyAll(cTransparent),
  padding: const WidgetStatePropertyAll(EdgeInsets.all(0)),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(smlRadius), // rounded corners
  )),
);

final buttonMainStyle = ButtonStyle(
  backgroundColor: WidgetStatePropertyAll(cPrimary),
  padding: WidgetStatePropertyAll(EdgeInsets.all(medRadius)),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(smlRadius), // rounded corners
  )),
);

final buttonSecondaryStyle = ButtonStyle(
  foregroundColor: WidgetStatePropertyAll(cBlack),
  backgroundColor: WidgetStatePropertyAll(cWhite),
  padding: WidgetStatePropertyAll(EdgeInsets.all(medRadius)),
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
    side: BorderSide(
      width: 1,
      color: cPrimary
    ),
    borderRadius: BorderRadius.circular(smlRadius),
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

class CustomButton extends StatelessWidget {
  final String variant;
  final void Function()? onPressed;
  final Widget child;
  const CustomButton({
    super.key,
    required this.variant,
    this.onPressed,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: variant == 'main' ? buttonMainStyle : variant == 'secondary' ? buttonSecondaryStyle :buttonListStyle,
      onPressed: onPressed,
      child: child,
    );
  }
}
