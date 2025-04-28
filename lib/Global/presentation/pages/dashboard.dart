import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_app/Global/presentation/components/custom_appbar.dart';
import 'package:to_do_list_app/Global/presentation/provider/system_provider.dart';
import 'package:to_do_list_app/Global/presentation/routes/routes.dart';
import 'package:to_do_list_app/Global/presentation/styles/colors.dart';
import 'package:to_do_list_app/Global/presentation/styles/fonts.dart';
import 'package:to_do_list_app/Global/presentation/styles/properties.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final systemProvider = context.watch<SystemProvider>();
    return Scaffold(
        appBar: customAppBar(
          context: context,
          title: pages[systemProvider.index ?? 0]['label']!.toString(),
        ),
        backgroundColor: cWhite,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(smlRadius),
          child:
              renderRoute(pages[systemProvider.index ?? 0]['path']!.toString()),
        )),
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: cTransparent,
            surfaceTintColor: cWhite,
            backgroundColor: cWhite,
            labelTextStyle: WidgetStateProperty.resolveWith(
                (Set<WidgetState> states) =>
                    states.contains(WidgetState.selected)
                        ? pMinusculoFont.copyWith(color: cPrimary)
                        : pMinusculoFont),
            iconTheme: WidgetStateProperty.resolveWith(
                (Set<WidgetState> states) =>
                    states.contains(WidgetState.selected)
                        ? const IconThemeData(color: cPrimary)
                        : const IconThemeData(color: cBlack)),
          ),
          child: NavigationBar(
              height: 60,
              selectedIndex: systemProvider.index ?? 0,
              onDestinationSelected: (int index) {
                setState(() {
                  systemProvider.setIndexByInt(index);
                });
              },
              destinations: pages.map((screen) {
                return NavigationDestination(
                  icon: Icon(
                      (systemProvider.index ?? 0) == pages.indexOf(screen)
                          ? screen['iconActive'] as IconData
                          : screen['iconInactive'] as IconData),
                  label: screen['label']!.toString(),
                );
              }).toList()),
        ));
  }
}
