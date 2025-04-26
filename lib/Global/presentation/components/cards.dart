import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

final cardShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(smlRadius),
);

const cardPadding =
    EdgeInsets.symmetric(horizontal: medRadius, vertical: medRadius);

class CustomCard extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? height;
  final double? width;
  const CustomCard({
    super.key,
    this.color,
    this.height,
    this.width,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    return Card.filled(
        shape: cardShape,
        color: color,
        child: Padding(padding: cardPadding, child: child));
  }
}
