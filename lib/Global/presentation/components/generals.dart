import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: medRadius,
      height: medRadius,
      child: CircularProgressIndicator(
        color: cSecondary,
        strokeWidth: 3.0,
      ),
    );
  }
}

class CustomRefreshIndicator extends StatelessWidget {
  const CustomRefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: cSecondary,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
