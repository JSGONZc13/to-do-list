import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: cSecondary,
      strokeWidth: 5.0,
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
