import 'package:flutter/material.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

final tabDecoration = BoxDecoration(
  color: cGrey, // o usa tu color personalizado
  borderRadius: BorderRadius.circular(smlRadius),
);

final tabDecorationSelected = BoxDecoration(
  color: cWhite,
  borderRadius: BorderRadius.circular(smlRadius),
);

class CustomStyledTabBar extends StatelessWidget {
  final List<Widget> tabs;

  const CustomStyledTabBar({
    super.key,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.start,
      isScrollable: true,
      dividerColor: cTransparent,
      labelColor: cPrimary,
      labelPadding: EdgeInsets.zero,
      labelStyle: pFontBold,
      unselectedLabelColor: cBlack,
      unselectedLabelStyle: pFont,
      indicatorColor: cTransparent,
      indicator: tabDecorationSelected,
      tabs: tabs,
    );
  }
}

class CustomTab extends StatelessWidget {
  final Widget child;

  const CustomTab({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: medRadius,
          vertical: smlRadius,
        ),
        child: child,
      ),
    );
  }
}
